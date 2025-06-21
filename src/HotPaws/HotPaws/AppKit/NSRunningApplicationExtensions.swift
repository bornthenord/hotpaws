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
            
            let focusedWindow = app.getAttribute(kAXFocusedWindowAttribute)
            
            if focusedWindow.status == .success {
                return (focusedWindow.value as! AXUIElement)
            } else {
                print("Error getting focused window: \(focusedWindow.status)")
            }
        } else {
            print("Error getting window")
        }
        
        return nil
    }
}
