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

  private let cameraViewModel: CameraViewModel

  init(cameraViewModel: CameraViewModel) {
    self.cameraViewModel = cameraViewModel
  }

  func makeUIViewController(context: Context) -> CameraUIViewController {
    CameraUIViewController(cameraManager: cameraViewModel.cameraManager)
  }

  func updateUIViewController(_ uiViewController: CameraUIViewController, context: Context) {}
}

final class CameraUIViewController: UIViewController {
  private let cameraManager: CameraManager

  init(cameraManager: CameraManager) {
    self.cameraManager = cameraManager
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    preconditionFailure("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    cameraManager.addPreviewLayerToView(view)
  }
}
