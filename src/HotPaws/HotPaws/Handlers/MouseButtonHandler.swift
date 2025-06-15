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
            Mouse.up()
            return .handled
        }
        
        if button == .mouseDown {
            Mouse.down()
            return .handled
        }
        
        if button == .mouseLeft {
            Mouse.left()
            return .handled
        }
        
        if button == .mouseRight {
            Mouse.right()
            return .handled
        }
        
        return .skipped
    }
}
