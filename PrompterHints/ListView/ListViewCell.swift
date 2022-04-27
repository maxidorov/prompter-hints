//
//  ListViewCell.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import SwiftUI

struct ListViewCell: View {
  let model: ListViewCellModel

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(model.title)
          .fontWeight(.bold)

        Spacer()

        Text("\(model.date)".prefix(10))
          .foregroundColor(.gray)
      }

      Spacer()

      Text(model.subtitle)
        .lineLimit(2)

      Spacer()
    }
    .padding()
    .background(Color.white)
    .cornerRadius(20)
  }
}

struct ListViewCell_Previews: PreviewProvider {
  static var previews: some View {
    ListViewCell(model: .init(from: .mock))
      .previewLayout(.fixed(width: 300, height: 80))
  }
}
