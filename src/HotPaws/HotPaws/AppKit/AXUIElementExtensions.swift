//
//  AXUIElement.swift
//  HotPaws
//
//  Created by cat dog on 21.06.2025.
//

import Foundation
import AppKit

extension AXUIElement {
    func getAttribute(_ name: String) -> (status: AXError, value: CFTypeRef?) {
        var value: CFTypeRef?
        let result = AXUIElementCopyAttributeValue(self, name as CFString, &value)
        
        return (result, value)
    }
    
    func getPoint() -> CGPoint? {
        let attribute = self.getAttribute(kAXPositionAttribute)
        
        if attribute.status == .success {
            let position = attribute.value as! AXValue
            var point = CGPoint.zero
            
            if AXValueGetType(position) == .cgPoint,
               AXValueGetValue(position, .cgPoint, &point) {
                return point
            }
        }
        
        return nil
    }
    
    func getClickableElements() -> [AXUIElement] {
        var clickableElements: [AXUIElement] = []
        let children = self.getAttribute(kAXChildrenAttribute)
        
        if children.status == .success {
            if let children = children.value as? [AXUIElement] {
                for child in children {
                    let role = child.getAttribute(kAXRoleAttribute)
                    
                    if role.status == .success, let role = role.value as? String {
                        // Проверяем, является ли элемент кликабельным
                        if role == kAXButtonRole as String ||
                            //                       role == kAXLinkRole as String ||
                            //                       role == kAXCheckboxRole as String ||
                            role == kAXRadioButtonRole as String ||
                            role == kAXPopUpButtonRole as String ||
                            role == kAXMenuItemRole as String {
                            clickableElements.append(child)
                        }
                    } else {
                        Logger.error("Error getting element type. AXError: \(role.status)")
                    }
                    
                    // Рекурсивно обходим дочерние элементы
                    clickableElements += child.getClickableElements()
                }
            } else {
                Logger.error("Failed convert children elements to [AXUIElement]")
            }
        } else {
            if children.status != .noValue {
                Logger.error("Failed get children elements. AXError: \(children.status)")
            }
        }
        
        return clickableElements
    }
}
