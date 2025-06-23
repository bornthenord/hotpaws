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
    
    func getFrame() -> NSRect? {
        if let size = self.getSize() {
            if let position = self.getCoordinate() {
                return NSRect(x: position.x, y: position.y, width: size.width, height: size.height)
            } else {
                Logger.error("Faield to get app coordinate")
            }
        } else {
            Logger.error("Faield to get app size")
        }
        
        return nil
    }
    
    func getSize() -> CGSize? {
        let attribute = self.getAttribute(kAXSizeAttribute)
        
        if attribute.status == .success {
            let axValue = attribute.value as! AXValue
            
            if AXValueGetType(axValue) == .cgSize {
                var size = CGSize.zero
                
                if AXValueGetValue(axValue, .cgSize, &size) {
                    return size
                } else {
                    Logger.error("Failed to get CGSize value from AXValue")
                }
            } else {
                Logger.error("Unexpected AXValue type: \(AXValueGetType(axValue))")
            }
        } else {
            Logger.error("Failed get size attribute for element: \(self)")
        }
        
        return nil
    }
    
    func getCoordinate() -> CGPoint? {
        let attribute = self.getAttribute(kAXPositionAttribute)
        
        if attribute.status == .success {
            let position = attribute.value as! AXValue
            var coordinate = CGPoint.zero
            
            if AXValueGetType(position) == .cgPoint,
               AXValueGetValue(position, .cgPoint, &coordinate) {
                return coordinate
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
