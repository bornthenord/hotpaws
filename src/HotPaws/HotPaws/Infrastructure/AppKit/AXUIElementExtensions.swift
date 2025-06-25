//
//  AXUIElement.swift
//  HotPaws
//
//  Created by cat dog on 21.06.2025.
//

import Foundation
import AppKit

let roles = [
    "AXButton",
//    "AXScrollArea",
//    "AXTextArea",
//    "AXScrollBar",
//    "AXStaticText",
//    "AXPopUpButton",
//    "AXMenuButton",
//    "AXRow",
//    "AXValueIndicator"
]

extension AXUIElement {
    func getAttribute(_ name: String) -> (status: AXError, value: CFTypeRef?) {
        var value: CFTypeRef?
        let result = AXUIElementCopyAttributeValue(self, name as CFString, &value)
        
        return (result, value)
    }
    
    func getFrame() -> NSRect? {
        if let size = self.getSize() {
            if let position = self.getCoordinate() {
                let screenFrame = NSScreen.screens.first!.frame
                let yOrigin = screenFrame.height - position.y - size.height
                
                return NSRect(x: position.x, y: yOrigin, width: size.width, height: size.height)
            } else {
                Logger.error("Faield to get app coordinate")
            }
        } else {
            Logger.error("Faield to get app size")
        }
        
        return nil
    }
    
    public func getSize() -> CGSize? {
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
    
    public func getCoordinate() -> CGPoint? {
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
        
        if let children = self.getChildren() {
            for child in children {
                if child.isClickable() {
                    clickableElements.append(child)
                }
                
                clickableElements += child.getClickableElements()
            }
        }
        
        return clickableElements
    }
    
    func getChildren() -> [AXUIElement]? {
        let children = self.getAttribute(kAXChildrenAttribute)
        
        if children.status == .success {
            if let children = children.value as? [AXUIElement] {
                return children
            }
        } else {
            if children.status != .noValue {
                Logger.error("Failed get children elements. AXError: \(children.status)")
            }
        }
        
        return nil
    }
    
    func isClickable() -> Bool {
        let role = self.getAttribute(kAXRoleAttribute)
        
        if role.status == .success, let role = role.value as? String {
            Logger.info("Role: \(role)")
            return roles.contains(role)
        } else {
            Logger.error("Error getting element type. AXError: \(role.status)")
        }
        
        return false
    }
    
    func isEnable() -> Bool {
        let isEnable = self.getAttribute(kAXEnabledAttribute)
        
        if isEnable.status == .success {
            if let isEnabled = isEnable.value as? Bool {
                return isEnabled
            }
        }
        
        return false
    }
    
    func isVisible() -> Bool {
        let isHidden = self.getAttribute(kAXHiddenAttribute)
        print(isHidden)
        if isHidden.status == .success {
            print(isHidden.value)
            if let isHiddenValue = isHidden.value as? Bool {
                return !isHiddenValue
            }
        }
        
        return false
    }
}
