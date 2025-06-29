//
//  HotSwapHandler.swift
//  HotPaws
//
//  Created by cat dog on 11.06.2025.
//

import Foundation

class MappingHandler: ClickHandler {
    func handle(_ click: Click, modifiers: inout Set<Modifier>) -> HandlerResult {
        for switchModifier in modifiers {
            if let layer = Config.mapping.rules[switchModifier] {
                if let rule = layer[click.key] {
                    if click.isDouble == rule.source.isDouble {
                        modifiers.remove(switchModifier)
                        
                        if rule.modifiers != nil {
                            for mm in rule.modifiers! {
                                modifiers.insert(mm.modifier)
                            }
                        }
                        
                        if rule.target.type == .click {
                            Keyboard.click(key: rule.target.key!, modifiers: modifiers)
                        }
                        
                        if rule.target.type == .navigation {
                            print("navigation")
                        }
                        
                        return .handled
                    }
                }
            }
        }
        
        return .skip
    }
}
