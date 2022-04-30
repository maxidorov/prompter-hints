//
//  SwitchCameraButtonView.swift
//  PrompterHints
//
//  Created by MSP on 29.04.2022.
//

import SwiftUI

struct CameraSwitchButtonView: View {
  var body: some View {
    Image(systemName: "arrow.triangle.2.circlepath.camera")
      .renderingMode(.original)
      .resizable()
      .aspectRatio(1.3, contentMode: .fit)
      .frame(height: 32)
  }
}

struct SwitchCameraButtonView_Previews: PreviewProvider {
  static var previews: some View {
    CameraSwitchButtonView()
  }
}
