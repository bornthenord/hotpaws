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

struct Click {
    let key: Key
    let isDouble: Bool
    
    func toDouble() -> Click {
        return Click(key: key, isDouble: true)
    }
}

protocol ClickHandler {
    func handle(_ click: Click, modifiers: inout Set<Modifier>) -> HandlerResult
}

protocol ModifierChangeHandler {
    func handle(modifiers: inout Set<Modifier>) -> HandlerResult
}
