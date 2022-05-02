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
  @Published var isRecording = false

  let cameraManager: CameraManager = {
    let cm = CameraManager()
    cm.cameraOutputMode = .videoWithMic
    return cm
  }()

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

      PHPhotoLibrary.shared().performChanges({
          PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: videoURL)
      }) { saved, _ in
        print(saved ? "saved" : "not saved")
      }
    }
  }
}

extension CameraViewModel {
  static let mock = CameraViewModel()
}
