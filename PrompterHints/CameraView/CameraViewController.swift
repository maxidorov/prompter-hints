//
//  CameraViewController.swift
//  PrompterHints
//
//  Created by MSP on 02.05.2022.
//

import UIKit
import SwiftUI
import CameraManager

final class CameraViewController: UIViewControllerRepresentable {
  typealias UIViewControllerType = CameraUIViewController

  func makeUIViewController(context: Context) -> CameraUIViewController {
    CameraUIViewController()
  }

  func updateUIViewController(_ uiViewController: CameraUIViewController, context: Context) {}
}

final class CameraUIViewController: UIViewController {

  private let cameraManager: CameraManager = {
    let cm = CameraManager()
    cm.cameraOutputMode = .videoWithMic
    return cm
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    cameraManager.addPreviewLayerToView(view)
  }
}
