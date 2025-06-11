//
//  HotSwapHandler.swift
//  HotPaws
//
//  Created by cat dog on 11.06.2025.
//

import Foundation

class HotSwapHandler : KeyDownHandler {
    func handle(key: Key, modifiers: inout Set<Modifier>) -> Bool {
        for switchModifier in modifiers {
            if let layer = Config.mapping[switchModifier] {
                if let mapping = layer[key] {
                    modifiers.remove(switchModifier)
                    
                    if mapping.modifiers != nil {
                        modifiers = modifiers.union(mapping.modifiers!)
                    }
                    
                    Keyboard.press(key: mapping.target, modifiers: modifiers)
                    
                    return true
                }
            }
        }
        
        return false
    }
}
