//
//  SettingsView.swift
//  PrompterHints
//
//  Created by MSP on 01.05.2022.
//

import SwiftUI

struct SettingsView: View {
  @Binding var presented: Bool
  @ObservedObject private var viewModel = SettingsViewModel()

  var body: some View {
    NavigationView {
      VStack {
        ScrollableTextView(
          text: HintModel.mock.text,
          speed: $viewModel.speed,
          fontSize: $viewModel.fontSize
        )
          .fadeEdjes()
          .padding(.horizontal)

        VStack {
          makeSpeedSlider($viewModel.speed)
          makeFontSizeSlider($viewModel.fontSize)
        }
        .padding()
        .background(Color.black.opacity(0.05))
        .cornerRadius(16)
        .padding(.horizontal)
      }
      .navigationTitle("Settings")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        Button {
          presented = false
        } label: {
          Image(systemName: "xmark.circle")
        }

      }
    }
  }

  private func makeSpeedSlider(_ value: Binding<CGFloat>) -> some View {
    Slider(
      value: value,
      in: .init(uncheckedBounds: (lower: 0, upper: 1)),
      label: { EmptyView() },
      minimumValueLabel: {
        Image(systemName: "tortoise")
      },
      maximumValueLabel: { Image(systemName: "hare") }
    )
  }

  private func makeFontSizeSlider(_ value: Binding<CGFloat>) -> some View {
    HStack {
      Text("a")
        .fontWeight(.medium)
        .frame(width: 30)

      Slider(
        value: value,
        in: .init(uncheckedBounds: (lower: 0, upper: 1))
      )

      Text("A")
        .fontWeight(.medium)
        .frame(width: 29)
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView(presented: .constant(true))
  }
}
