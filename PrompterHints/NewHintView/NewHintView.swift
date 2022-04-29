//
//  NewHintView.swift
//  PrompterHints
//
//  Created by MSP on 28.04.2022.
//

import SwiftUI

struct NewHintView: View {
  @ObservedObject var viewModel: NewHintViewModel

  var body: some View {
    TextView(text: $viewModel.text).equatable()  // dummy fix to prevent missing cursor
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .padding(.horizontal)
      .navigationTitle("New Hint")
      .navigationBarTitleDisplayMode(.inline)
      .ignoresSafeArea(.container, edges: [.bottom])
      .onAppear(perform: viewModel.reset)
  }
}

struct NewHintView_Previews: PreviewProvider {
  static var previews: some View {
    NewHintView(viewModel: .mock)
  }
}
