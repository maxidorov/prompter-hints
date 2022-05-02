//
//  EditHintView.swift
//  PrompterHints
//
//  Created by MSP on 29.04.2022.
//

import SwiftUI

struct EditHintView: View {
  @ObservedObject var viewModel: EditHintViewModel
  @State private var cameraViewPresented = false

  var body: some View {
    TextView(text: $viewModel.text).equatable() // dummy fix to prevent missing cursor
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .padding(.horizontal)
      .ignoresSafeArea(.container, edges: [.bottom])
      .navigationTitle("Edit Hint")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        Button {
          cameraViewPresented = true
        } label: {
          Image(systemName: "camera")
        }
      }
      .fullScreenCover(
        isPresented: $cameraViewPresented,
        onDismiss: { cameraViewPresented = false },
        content: {
          CameraView(viewModel: CameraViewModel(text: viewModel.text))
        }
      )
  }
}
