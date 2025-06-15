//
//  MouseClickHandler.swift
//  HotPaws
//
//  Created by cat dog on 15.06.2025.
//

import Foundation

class MouseButtonHandler : ButtonHandler {
    let stepPixsels: CGFloat = 20
    
    func handle(button: inout Button, modifiers: inout Set<Button>) -> HandlerResult {
        
        if button == .mouseUp {
            Mouse.up(stepPixsels)
            return .handled
        }
        
        if button == .mouseDown {
            Mouse.down(stepPixsels)
            return .handled
        }
        
        if button == .mouseLeft {
            Mouse.left(stepPixsels)
            return .handled
        }
        
        if button == .mouseRight {
            Mouse.right(stepPixsels)
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
