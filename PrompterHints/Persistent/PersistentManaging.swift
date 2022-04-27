//
//  PersistentManaging.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

protocol PersistentManaging {
  func save(hints: [HintModel])
  func getHints() -> [HintModel]
}
