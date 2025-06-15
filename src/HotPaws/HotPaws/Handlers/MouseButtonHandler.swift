//
//  MouseClickHandler.swift
//  HotPaws
//
//  Created by cat dog on 15.06.2025.
//

import Foundation

class MouseButtonHandler : ButtonHandler {
    func handle(button: inout Button, modifiers: inout Set<Button>) -> HandlerResult {
        
        if button == .mouseUp {
            Mouse.up(Config.mouseCursorStep)
            return .handled
        }
        
        if button == .mouseDown {
            Mouse.down(Config.mouseCursorStep)
            return .handled
        }
        
        if button == .mouseLeft {
            Mouse.left(Config.mouseCursorStep)
            return .handled
        }
        
        if button == .mouseRight {
            Mouse.right(Config.mouseCursorStep)
            return .handled
        }
        
        if button == .mouseLeftClick {
            Mouse.leftClick()
            return .handled
        }
        
        if button == .mouseRightClick {
            Mouse.rightClick()
            return .handled
        }
        
        return .skipped
    }
}
