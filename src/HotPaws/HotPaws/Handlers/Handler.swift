//
//  ButtonHandler.swift
//  HotPaws
//
//  Created by cat dog on 15.06.2025.
//

import Foundation

enum HandlerResult {
    case handled
    case skipped
}

protocol ButtonHandler {
    func handle(button: inout Button, modifiers: inout Set<Button>) -> HandlerResult
}

protocol ModifierHandler {
    func handle(modifiers: inout Set<Button>) -> HandlerResult
}
