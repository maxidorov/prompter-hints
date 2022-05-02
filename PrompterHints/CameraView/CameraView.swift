//
//  CameraView.swift
//  PrompterHints
//
//  Created by MSP on 29.04.2022.
//

import SwiftUI

struct CameraView: View {
  var body: some View {
    ZStack {
      CameraViewController()
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
    .overlay(CameraFooterView(), alignment: .bottom)
  }
}

struct CameraView_Previews: PreviewProvider {
  static var previews: some View {
    CameraView()
  }
}
