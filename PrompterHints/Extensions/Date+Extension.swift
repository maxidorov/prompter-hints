//
//  Date+Extension.swift
//  PrompterHints
//
//  Created by MSP on 01.05.2022.
//

import Foundation

extension Date {
  func string(format: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    return formatter.string(from: self)
  }
}
