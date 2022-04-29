//
//  EditHintView.swift
//  PrompterHints
//
//  Created by MSP on 29.04.2022.
//

import SwiftUI

struct EditHintView: View {
  @ObservedObject var viewModel: EditHintViewModel

  var body: some View {
    TextView(text: $viewModel.text).equatable() // dummy fix to prevent missing cursor
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .padding(.horizontal)
      .navigationTitle("Edit Hint")
      .navigationBarTitleDisplayMode(.inline)
      .ignoresSafeArea(.container, edges: [.bottom])
  }
}
