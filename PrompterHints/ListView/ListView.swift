//
//  ListView.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI

struct ListView: View {
  @ObservedObject var store: HintsStore
  @State var settingsViewPresented = false

  private var settingsToolbar: ToolbarItem<Void, Button<Image>> {
    ToolbarItem(placement: .navigationBarTrailing) {
      Button {
        settingsViewPresented = true
      } label: {
        Image(systemName: "slider.horizontal.3")
      }
    }
  }

  var body: some View {
    NavigationView {
      ScrollView {
        ForEach(store.hints) { hint in
          NavigationLink(destination: makeDestination(for: hint)) {
            makeCell(for: hint)
          }
          .buttonStyle(.plain)
          .contextMenu {
            Button {
              withAnimation { store.delete(id: hint.id) }
            } label: {
              Label("Delete", systemImage: "trash")
            }
          }
          .padding(.vertical, .s1)

        }
        .padding(.horizontal)
        .padding(.bottom, 80)
      }
      .frame(maxWidth: .infinity)
      .overlay(
        NewNoteButton(store: store).dropShadow().padding(.bottom),
        alignment: .bottom
      )
      .navigationTitle("Hints")
      .toolbar { settingsToolbar }
      .sheet(
        isPresented: $settingsViewPresented,
        onDismiss: { settingsViewPresented = false },
        content: { SettingsView(presented: $settingsViewPresented) }
      )
    }
  }

  private func makeCell(for hint: HintModel) -> some View {
    ListViewCell(model: .init(from: hint))
      .dropShadow()
  }

  private func makeDestination(for hint: HintModel) -> some View {
    EditHintView(viewModel: .init(store: store, hint: hint))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ListView(store: .mock)
  }
}
