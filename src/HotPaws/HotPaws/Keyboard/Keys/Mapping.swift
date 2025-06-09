//
//  MappingRule.swift
//  HotPaws
//
//  Created by cat dog on 09.06.2025.
//


import Foundation

struct Mapping {
    var key: Key
    var targets: Set<Key>
    var modifiers: Set<Modifier>?
}
