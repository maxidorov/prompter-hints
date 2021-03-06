//
//  SettingsView.swift
//  PrompterHints
//
//  Created by MSP on 01.05.2022.
//

import SwiftUI

struct SettingsView: View {
  @Binding var presented: Bool
  @ObservedObject private var appSettings = ObservableAppSettings()

  var body: some View {
    NavigationView {
      VStack {
        ScrollableTextView(
          text: HintModel.mock.text,
          speed: $appSettings.textViewSpeed,
          fontSize: $appSettings.textViewFontSize,
          isScrolling: .constant(true)
        )
          .padding(.horizontal)

        VStack {
          makeSpeedSlider($appSettings.textViewSpeed)
          makeFontSizeSlider($appSettings.textViewFontSize)
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
      .onAppear { AnalyticsManager.shared.log(.settingsScreenOpened) }
      .onDisappear { AnalyticsManager.shared.log(.settingsScreenClosed) }
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
        in: .init(uncheckedBounds: (lower: 10, upper: 30))
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
