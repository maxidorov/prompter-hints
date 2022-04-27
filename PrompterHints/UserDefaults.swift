//
//  UserDefaults.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import Foundation

struct UserDefaultKeys {
  static let textViewTextFontSize  = "textViewTextFontSize"
  static let textScrollingSpeed = "textScrollingSpeed"
}

extension UserDefaults {
  static let applicationDefaults: [String : Any] = [
    UserDefaultKeys.textViewTextFontSize: 18.0,
    UserDefaultKeys.textScrollingSpeed: 0.375
  ]

  var textViewTextFontSize: Float {
    get { float(forKey: UserDefaultKeys.textViewTextFontSize) }
    set { set(newValue, forKey: UserDefaultKeys.textViewTextFontSize) }
  }

  var textScrollingSpeed: Float {
    get { float(forKey: UserDefaultKeys.textScrollingSpeed) }
    set { set(newValue, forKey: UserDefaultKeys.textScrollingSpeed) }
  }
}
