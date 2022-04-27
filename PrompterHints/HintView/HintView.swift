//
//  HintView.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI
import Combine

struct HintView: View {
  @ObservedObject var viewModel: HintViewModel

  private var textView: some View {
    TextView { textView in
      textView.text = viewModel.text
      textView.showsVerticalScrollIndicator = false
      viewModel.makeFirstResponderIfNeeded(textView)
    }
  }

  var body: some View {
    textView
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .padding(.horizontal)
      .navigationTitle(viewModel.mode.title)
      .navigationBarTitleDisplayMode(.inline)
      .ignoresSafeArea(.container, edges: [.bottom])
  }
}

struct HintView_Previews: PreviewProvider {
  static var previews: some View {
    HintView(viewModel: .new)
  }
}
