//
//  NewHintView.swift
//  PrompterHints
//
//  Created by MSP on 28.04.2022.
//

import SwiftUI

struct NewHintView: View {
  @ObservedObject var viewModel: NewHintViewModel
  @State private var cameraViewPresented = false

  var body: some View {
    TextView(text: $viewModel.text).equatable()  // dummy fix to prevent missing cursor
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .padding(.horizontal)
      .ignoresSafeArea(.container, edges: [.bottom])
      .navigationTitle("New Hint")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        Button {
          cameraViewPresented = true
        } label: {
          Image(systemName: "camera")
        }
      }
      .onAppear(perform: viewModel.reset)
      .fullScreenCover(
        isPresented: $cameraViewPresented,
        onDismiss: { cameraViewPresented = false },
        content: {
          CameraView(
            presented: $cameraViewPresented,
            viewModel: CameraViewModel(
              text: viewModel.text,
              speed: AppSettings.textViewSpeed,
              fontSize: AppSettings.textViewFontSize
            )
          )
        }
      )
  }
}

struct NewHintView_Previews: PreviewProvider {
  static var previews: some View {
    NewHintView(viewModel: .mock)
  }
}
