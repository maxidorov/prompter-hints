//
//  HintModel.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import Foundation

struct HintModel: Identifiable {
  var id: Int
  var title: String
  var subtitle: String
  var date: Date
}

extension HintModel {
  static let mock = HintModel(
    id: 0,
    title: "Title",
    subtitle: "Subtitle",
    date: Date()
  )
}
