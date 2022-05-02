//
//  CameraBottomView.swift
//  PrompterHints
//
//  Created by MSP on 29.04.2022.
//

import SwiftUI

struct CameraFooterView: View {
  @Binding var isRecording: Bool
  var startRecordingAction: () -> Void
  var stopRecrodingAction: () -> Void

  var body: some View {
    HStack {
      Rectangle()
        .foregroundColor(.clear)
        .frame(height: CameraRecordButtonView.size)
        .frame(maxWidth: .infinity)

      CameraRecordButtonView(
        isRecording: $isRecording,
        startRecordingAction: startRecordingAction,
        stopRecrodingAction: stopRecrodingAction
      )
        .frame(maxWidth: .infinity)
      CameraSwitchButtonView()
        .frame(maxWidth: .infinity)
    }
  }
}

struct CameraBottomView_Previews: PreviewProvider {
  static var previews: some View {
    CameraFooterView(
      isRecording: .constant(false),
      startRecordingAction: {},
      stopRecrodingAction: {}
    )
      .previewLayout(.sizeThatFits)
  }
}
