//
//  KeyboardClickHandler.swift
//  HotPaws
//
//  Created by cat dog on 11.06.2025.
//

import Foundation

class KeyHandler : ButtonHandler {
    func handle(button: inout Button, modifiers: inout Set<Button>) -> HandlerResult {
        for switchModifier in modifiers {
            if let layer = Config.mapping[switchModifier] {
                if let mapping = layer[button] {
                    modifiers.remove(switchModifier)
                    
                    if mapping.modifiers != nil {
                        modifiers = modifiers.union(mapping.modifiers!)
                    }
                    
                    do {
                        try Keyboard.press(key: mapping.target, modifiers: modifiers)
                    }
                    catch {
                        print(error)
                    }
                    
                    return .handled
                }
            }
        }
        
        return .skipped
    }
}
