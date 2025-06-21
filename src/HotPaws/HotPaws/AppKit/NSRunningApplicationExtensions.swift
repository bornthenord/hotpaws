//
//  NSRunningApplicationExtensions.swift
//  HotPaws
//
//  Created by cat dog on 21.06.2025.
//

import Foundation
import AppKit

extension NSRunningApplication {
    static func getCurrentApp() -> AXUIElement? {
        if let app = NSWorkspace.shared.frontmostApplication {
            let app = AXUIElementCreateApplication(app.processIdentifier)
            
            var focusedWindow: CFTypeRef?
            
            let windowResult = AXUIElementCopyAttributeValue(app, kAXFocusedWindowAttribute as CFString, &focusedWindow)
            
            if windowResult == .success {
                return (focusedWindow as! AXUIElement)
            } else {
                print("Error getting focused window: \(windowResult)")
            }
        } else {
            print("Error getting window")
        }
        
        return nil
    }
}
