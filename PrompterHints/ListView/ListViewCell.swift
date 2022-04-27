//
//  ListViewCell.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI

struct ListViewCell: View {
  let model: HintModel

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(model.title)
        Spacer()
        Text("\(model.date)".prefix(10))
      }

      Spacer()

      Text(model.subtitle)

      Spacer()
    }
    .padding()
    .background(Color.white)
    .cornerRadius(20)
  }
}

struct ListViewCell_Previews: PreviewProvider {
  static var previews: some View {
    ListViewCell(model: .mock)
      .previewLayout(.fixed(width: 300, height: 80))
  }
}
