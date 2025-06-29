//
//  KeyHandler.swift
//  HotPaws
//
//  Created by cat dog on 28.06.2025.
//

import Foundation

enum HandlerResult: String {
    case handled
    case skip
}

protocol ClickHandler {
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> HandlerResult
}

protocol ModifierChangeHandler {
    func handle(modifiers: inout Set<Modifier>) -> HandlerResult
}
