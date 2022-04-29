//
//  CameraButtonView.swift
//  PrompterHints
//
//  Created by MSP on 29.04.2022.
//

import SwiftUI

struct CameraButtonView: View {
  @Binding var isRecording: Bool

  var body: some View {
    ZStack {
      Circle()
        .foregroundColor(.white)

      Circle()
        .foregroundColor(.black)
        .frame(square: 40)

      Rectangle()
        .foregroundColor(.red)
        .frame(square: isRecording ? 20: 38)
        .cornerRadius(isRecording ? 6 : 19)
    }
    .frame(square: 44)
  }
}

struct CameraButtonView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CameraButtonView(isRecording: .constant(false))
      CameraButtonView(isRecording: .constant(true))
    }
      .background(Color.black)
      .previewLayout(.fixed(width: 44, height: 44))
  }
}
