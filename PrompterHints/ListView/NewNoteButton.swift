//
//  NewNoteButton.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI

struct NewNoteButton: View {
  var body: some View {
    NavigationLink(destination: HintView(viewModel: .new)) {
      Text("New Hint")
        .fontWeight(.medium)
        .foregroundColor(.black.opacity(0.8))
        .padding(.s4)
        .background(Color.white)
        .clipShape(Capsule())
    }
    .buttonStyle(.plain)
  }
}

struct NewNoteButton_Previews: PreviewProvider {
  static var previews: some View {
    NewNoteButton()
      .previewLayout(.sizeThatFits)
  }
}
