//
//  HotSwapHandler.swift
//  HotPaws
//
//  Created by cat dog on 11.06.2025.
//

import Foundation

class SwitchModifierHandler : KeyHandler {
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> Bool {
        for switchModifier in modifiers {
            if let layer = Config.mapping[switchModifier] {
                if let mapping = layer[key] {
                    modifiers.remove(switchModifier)
                    
                    if mapping.modifiers != nil {
                        modifiers = modifiers.union(mapping.modifiers!)
                    }
                    
                    key = mapping.target
                    
                    return false
                }
            }
        }
        
        return true
    }
}
