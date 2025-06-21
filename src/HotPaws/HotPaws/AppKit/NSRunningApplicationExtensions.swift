//
//  NSRunningApplicationExtensions.swift
//  HotPaws
//
//  Created by cat dog on 21.06.2025.
//

import Foundation
import AppKit

extension NSRunningApplication {
    func getCurrentApp() -> AXUIElement? {
        if let app = NSWorkspace.shared.frontmostApplication {
            return AXUIElementCreateApplication(app.processIdentifier)
        }
        
        return nil
    }
}
