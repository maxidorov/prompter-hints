//
//  ListViewCellModel.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import Foundation

struct ListViewCellModel: Identifiable {
  let id: Int
  let title: String
  let subtitle: String
  let date: Date

  init(from hintModel: HintModel) {
    self.id = hintModel.id
    self.title = hintModel.text.components(separatedBy: .nel).first ?? ""
    self.subtitle = hintModel.text.components(separatedBy: .nel).dropFirst().joined(separator: .nel)
    self.date = hintModel.date
  }
}
