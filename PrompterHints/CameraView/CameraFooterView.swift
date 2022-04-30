//
//  CameraBottomView.swift
//  PrompterHints
//
//  Created by MSP on 29.04.2022.
//

import SwiftUI

struct CameraFooterView: View {
  var body: some View {
    HStack {
      Rectangle()
        .foregroundColor(.clear)
        .frame(height: CameraRecordButtonView.size)
        .frame(maxWidth: .infinity)
      CameraRecordButtonView(isRecording: .constant(true))
        .frame(maxWidth: .infinity)
      CameraSwitchButtonView()
        .frame(maxWidth: .infinity)
    }
  }
}

struct CameraBottomView_Previews: PreviewProvider {
  static var previews: some View {
    CameraFooterView()
      .previewLayout(.sizeThatFits)
  }
}
