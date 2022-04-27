//
//  HintViewMode.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

enum HintViewMode {
  case new
  case edit

  var title: String {
    switch self {
    case .new:
      return "New Note"
    case .edit:
      return "Edit Note"
    }
  }
}
