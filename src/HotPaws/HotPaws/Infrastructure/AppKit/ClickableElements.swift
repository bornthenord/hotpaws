//
//  ClickableElements.swift
//  HotPaws
//
//  Created by cat dog on 22.08.25.
//

import Foundation
import AppKit

let clickableRoles: Set<String> = [
    kAXButtonRole,
    kAXScrollAreaRole,
    kAXScrollBarRole,
    kAXPopUpButtonRole,
    kAXMenuButtonRole,
    kAXMenuItemRole,
    kAXValueIndicatorRole,
    kAXSliderRole,
    kAXCheckBoxRole,
    kAXComboBoxRole,
    kAXCellRole,
    kAXTextAreaRole,
    "AXLink",
]

extension AXUIElement {
    func getClickableElements() -> [AXUIElement] {
        var clickableElements: [AXUIElement] = []
        
        if let children = self.getChildren() {
            for child in children {
                if child.isEnable() && child.isVisible() && child.isClickable() {
                    clickableElements.append(child)
                }
                
                clickableElements += child.getClickableElements()
            }
        }
        
        return clickableElements
    }
    
    func isClickable() -> Bool {
        if let role = self.getAttribute(kAXRoleAttribute) {
            if role.status == .success {
                if let roleValue = role.value as? String {
                    return clickableRoles.contains(roleValue)
                }
            }
        }
        
        return false
    }
}
