//
//  SubsciptiionView.swift
//  PrompterHints
//
//  Created by MSP on 07.06.2022.
//

import SwiftUI

struct SubscriptionView: View {
  @Environment(\.openURL) var openURL

  @ObservedObject var viewModel: SubscriptionViewModel
  @Binding var showSubscriptionView: Bool

  private var closeButton: some View {
    HStack {
      Image(systemName: "xmark").asButton {
        showSubscriptionView = false
      }.opacity(0.3)
      Spacer()
    }
  }

  private var header: some View {
    VStack(spacing: 16) {
      Text("PREMUIM")
        .font(.system(size: 12))
        .fontWeight(.bold)

      Text("Get Unlimited Functionality")
        .font(.system(size: 26))
        .fontWeight(.bold)
    }
    .foregroundColor(Color(hex: Brand.colorHex))
  }

  private var icon: some View {
    ZStack {
      Color.white
        .frame(width: 196, height: 196)
        .cornerRadius(44)
        .shadow(color: .gray, radius: 8, x: 0, y: 0)

      Text("P")
        .font(.system(size: 128))
        .fontWeight(.bold)
    }
  }

  private var features: some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack {
        Text("🔥")
          .font(.system(size: 34))
          .frame(width: 40)

        Text("Unlimited quantity of notes")
          .font(.system(size: 20))
          .fontWeight(.medium)
      }
      HStack {
        Text("⏰")
          .font(.system(size: 34))
          .frame(width: 40)

        Text("Unlimited time of recording")
          .font(.system(size: 20))
          .fontWeight(.medium)
      }
    }
  }

  private var separator: some View {
    Rectangle()
      .frame(width: 1, height: 10)
  }

  private var payButton: AnyView {
    let title: String?
    switch viewModel.productViewState {
    case .loading:
      title = nil
    case let .loaded(product):
      if let product = product, let skProduct = product.skProduct {
        title = skProduct.readableDescription
      } else {
        title = "Please, check Internet connection"
      }
    }

    if let title = title {
      return AnyView(Text(title)
        .font(.system(size: 20))
        .fontWeight(.bold)
        .foregroundColor(.white)
        .padding(.vertical)
        .padding(.horizontal, 32)
        .background(Color(hex: Brand.colorHex))
        .clipShape(Capsule()))
    } else {
      return AnyView(ProgressView())
    }
  }

  private var footer: some View {
    GeometryReader { geo in
      let size = CGSize(
        width: geo.size.width / 3,
        height: geo.size.height
      )

      ZStack {
        HStack(spacing: 0) {
          Text("Privacy Policy")
            .privacyStyled(size: size)
            .asButton {
              URL(string: "").apply {
                openURL($0)
              }
            }

          Text("Restore")
            .privacyStyled(size: size)

          Text("Terms of use")
            .privacyStyled(size: size)
            .asButton {
              URL(string: "").apply {
                openURL($0)
              }
            }
        }

        HStack {
          Spacer()
          separator
          Spacer()
          separator
          Spacer()
        }
      }
    }
    .frame(height: 20)
  }

  var body: some View {
    VStack(spacing: 16) {
      closeButton
      header
      Spacer()
      icon
      Spacer()
      features
      Spacer()
      payButton
      footer
    }
    .padding([.leading, .top, .trailing])
    .onAppear(perform: viewModel.fetchPaywalls)
    .allowAutoDismiss(false)
  }
}

extension Text {
  func privacyStyled(size: CGSize) -> some View {
    self
      .lineLimit(1)
      .font(.system(size: 10))
      .minimumScaleFactor(0.1)
      .frame(width: size.width, height: size.height)
  }
}
