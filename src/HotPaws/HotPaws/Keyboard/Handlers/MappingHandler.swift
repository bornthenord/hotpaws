//
//  HotSwapHandler.swift
//  HotPaws
//
//  Created by cat dog on 11.06.2025.
//

import Foundation

class MappingHandler: ClickHandler {
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> HandlerResult {
        for switchModifier in modifiers {
            if let layer = Config.mapping.rules[switchModifier] {
                if let mapping = layer[key] {
                    modifiers.remove(switchModifier)
                    
                    if mapping.modifiers != nil {
                        for mm in mapping.modifiers! {
                            modifiers.insert(mm.modifier)
                        }
                    }
                    
                    if mapping.target.type == .KeyPress {
                        Keyboard.click(key: mapping.target.key!, modifiers: modifiers)
                    }
                    
                    return .handled
                }
            }
        }
        
        return .skip
    }
}
