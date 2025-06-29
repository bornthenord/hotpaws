//
//  HotSwapHandler.swift
//  HotPaws
//
//  Created by cat dog on 11.06.2025.
//

import Foundation

class MappingHandler: ClickHandler {
    let view = NavigationWindow()
    var navigation:Navigation!
    
    func handle(_ click: Click, modifiers: inout Set<Modifier>) -> HandlerResult {
        if click.key == .escape {
            if view.isShowing() {
                view.hide()
                return .handled
            }
        }
        
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
                        } else if rule.target.type == .navigation {
                            if !view.isShowing() {
                                navigation = Navigation()
                                navigation.markout(handler: view.addLabel)
                                view.show()
                            }
                        }
                        
                        return .handled
                    }
                }
            }
        }
        
        return .skip
    }
}
