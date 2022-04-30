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
      Color.blue // CameraView
        .ignoresSafeArea()

      VStack {
        ScrollableTextView(text: HintModel.mock.text)
          .padding()

        CameraFooterView()
      }
    }
  }
}

struct CameraView_Previews: PreviewProvider {
  static var previews: some View {
    CameraView()
  }
}
