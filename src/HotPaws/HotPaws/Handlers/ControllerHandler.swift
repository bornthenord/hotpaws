//
//  ControllerHandler.swift
//  HotPaws
//
//  Created by cat dog on 15.06.2025.
//

import Foundation

class ControllerHandler : ButtonHandler {
    let keyHandler: ButtonHandler
    let mouseHandler: ButtonHandler
    
    init(keyHandler: ButtonHandler, mouseHandler: ButtonHandler) {
        self.keyHandler = keyHandler
        self.mouseHandler = mouseHandler
    }
    
    func handle(button: inout Button, modifiers: inout Set<Button>) -> HandlerResult {
        if button.isMouseButton() {
            return self.mouseHandler.handle(button: &button, modifiers: &modifiers)
        }
        
        return self.keyHandler.handle(button: &button, modifiers: &modifiers)
    }
}
