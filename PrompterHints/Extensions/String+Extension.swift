//
//  String+Extension.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import Foundation

extension String {
  static let nel = nextLine
}

extension CharacterSet {
  static let nel: Self = CharacterSet(charactersIn: nextLine)
}

private let nextLine = "\n"
