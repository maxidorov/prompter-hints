//
//  CameraViewController.swift
//  PrompterHints
//
//  Created by MSP on 02.05.2022.
//

import UIKit
import SwiftUI

final class CameraViewController: UIViewControllerRepresentable {
  typealias UIViewControllerType = CameraUIViewController

  func makeUIViewController(context: Context) -> CameraUIViewController {
    CameraUIViewController()
  }

  func updateUIViewController(_ uiViewController: CameraUIViewController, context: Context) {}
}

final class CameraUIViewController: UIViewController {}
