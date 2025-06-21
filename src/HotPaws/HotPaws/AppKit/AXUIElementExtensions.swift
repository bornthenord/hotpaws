//
//  AXUIElement.swift
//  HotPaws
//
//  Created by cat dog on 21.06.2025.
//

import Foundation
import AppKit

extension AXUIElement {
    func getPoint() -> CGPoint? {
        var value: CFTypeRef?
        let result = AXUIElementCopyAttributeValue(self, kAXPositionAttribute as CFString, &value)
        
        print(result.rawValue)
        
        if result == .success {
            let position = value as! AXValue
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
        var childrenValue: CFTypeRef?
        
        let result = AXUIElementCopyAttributeValue(self, kAXChildrenAttribute as CFString, &childrenValue)
        
        if result == .success {
            if let children = childrenValue as? [AXUIElement] {
                for child in children {
                    var elementTypeValue: AnyObject?
                    let typeResult = AXUIElementCopyAttributeValue(child, kAXRoleAttribute as CFString, &elementTypeValue)
                    
                    if typeResult == .success, let role = elementTypeValue as? String {
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
                        print("Failed to get element type: \(typeResult)")
                    }
                    
                    // Рекурсивно обходим дочерние элементы
                    clickableElements += child.getClickableElements()
                }
            } else {
                print("Failed convert children elementsf to [AXUIElement]")
            }
        } else {
            print("Failed to get children elements: \(result)")
        }
        
        return clickableElements
    }
}
