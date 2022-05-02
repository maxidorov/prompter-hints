//
//  CameraView.swift
//  PrompterHints
//
//  Created by MSP on 29.04.2022.
//

import SwiftUI

struct CameraView: View {
  @ObservedObject var viewModel: CameraViewModel

  var body: some View {
    ZStack {
      CameraViewController(cameraViewModel: viewModel)
        .ignoresSafeArea()

      ScrollableTextView(
        text: HintModel.mock.text,
        speed: .constant(0.5),
        fontSize: .constant(0.5)
      )
        .ignoresSafeArea()
        .fadeEdjes()
        .padding(.horizontal)
    }
    .overlay(
      CameraFooterView(
        isRecording: $viewModel.isRecording,
        startRecordingAction: viewModel.startRecording,
        stopRecrodingAction: viewModel.stopRecording
      ),
      alignment: .bottom
    )
  }
}

struct CameraView_Previews: PreviewProvider {
  static var previews: some View {
    CameraView(viewModel: .mock)
  }
}
