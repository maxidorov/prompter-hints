//
//  CameraButtonView.swift
//  PrompterHints
//
//  Created by MSP on 29.04.2022.
//

import SwiftUI

struct CameraRecordButtonView: View {
  static let size: CGFloat = 68

  @Binding var isRecording: Bool
  var startRecordingAction: () -> Void
  var stopRecrodingAction: () -> Void

  var body: some View {
    ZStack {
      Circle()
        .foregroundColor(.white)

      Circle()
        .foregroundColor(.black)
        .frame(square: Self.size - 4)

      Rectangle()
        .foregroundColor(.red)
        .frame(square: isRecording ? 32: Self.size - 8)
        .cornerRadius(isRecording ? 10 : (Self.size - 8) / 2)
    }
    .frame(square: Self.size)
    .onTapGesture {
      if isRecording {
        stopRecrodingAction()
      } else {
        startRecordingAction()
      }
    }
  }
}

struct CameraButtonView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CameraRecordButtonView(isRecording: .constant(false), startRecordingAction: {}, stopRecrodingAction: {})
      CameraRecordButtonView(isRecording: .constant(true), startRecordingAction: {}, stopRecrodingAction: {})
    }
      .background(Color.black)
      .previewLayout(.fixed(width: 68, height: 68))
  }
}
