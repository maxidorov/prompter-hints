//
//  CameraView.swift
//  PrompterHints
//
//  Created by MSP on 29.04.2022.
//

import SwiftUI

struct CameraView: View {
  @Binding var presented: Bool
  @ObservedObject var viewModel: CameraViewModel

  var body: some View {
    ZStack {
      CameraViewController(cameraViewModel: viewModel)
        .ignoresSafeArea()

      ScrollableTextView(
        text: viewModel.text,
        speed: .constant(0.5),
        fontSize: .constant(0.5)
      )
        .padding(.horizontal)
    }
    .overlay(
      Image(systemName: "xmark.circle.fill")
        .resizable()
        .frame(square: 24)
        .offset(x: -24, y: 0)
        .opacity(0.5)
        .onTapGesture {
          presented = false
        },
      alignment: .topTrailing
    )
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
    CameraView(
      presented: .constant(true),
      viewModel: .mock
    )
  }
}
