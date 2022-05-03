//
//  Optional+Extension.swift
//  PrompterHints
//
//  Created by MSP on 03.05.2022.
//

extension Optional {
  func apply(_ f: (Wrapped) -> Void) {
    guard let a = self else { return }
    f(a)
  }
}
