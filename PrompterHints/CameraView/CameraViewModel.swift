//
//  CameraViewModel.swift
//  PrompterHints
//
//  Created by MSP on 02.05.2022.
//

import Foundation
import Combine
import CameraManager
import Photos
import SwiftUI

final class CameraViewModel: ObservableObject {
  var text: String
  var speed: CGFloat
  var fontSize: CGFloat

  @Published var isRecording = false
  @Published var cameraDevice: CameraDevice = .back

  private var cancellable: AnyCancellable?

  let cameraManager: CameraManager = {
    let cm = CameraManager()
    cm.cameraOutputMode = .videoWithMic
    return cm
  }()

  init(
    text: String,
    speed: CGFloat,
    fontSize: CGFloat
  ) {
    self.text = text
    self.speed = speed
    self.fontSize = fontSize

    self.cancellable = $cameraDevice.sink { [weak self] cameraDevice in
      self?.cameraManager.cameraDevice = cameraDevice
    }
  }

  func startRecording() {
    cameraManager.startRecordingVideo()
    withAnimation {
      isRecording = true
    }
  }

  func stopRecording() {
    withAnimation {
      isRecording = false
    }

    cameraManager.stopVideoRecording { videoURL, _ in
      guard let videoURL = videoURL else {
        // Handle error of no recorded video URL
        return
      }

      PHPhotoLibrary.shared().performChanges {
        // FIXME: save twice
        PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: videoURL)
      } completionHandler: { saved, error in
        error.apply { print("Error:", $0) }
        print("Saved:", saved)
      }
    }
  }
}

extension CameraDevice {
  mutating func toggle() {
    switch self {
    case .front:
      self = .back
    case .back:
      self = .front
    }
  }
}

extension CameraViewModel {
  static let mock = CameraViewModel(text: HintModel.mock.text, speed: 0.5, fontSize: 18)
}
