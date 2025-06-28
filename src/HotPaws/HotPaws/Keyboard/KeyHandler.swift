//
//  KeyHandler.swift
//  HotPaws
//
//  Created by cat dog on 28.06.2025.
//

import Foundation

enum KeyHandlerResult: String {
    case handled
    case skip
}

protocol KeyHandler {
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> KeyHandlerResult
}

protocol ModifierChangeHandler {
    func handle(modifiers: inout Set<Modifier>) -> KeyHandlerResult
}
