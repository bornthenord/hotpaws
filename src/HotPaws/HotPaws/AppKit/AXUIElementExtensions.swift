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
        let result = AXUIElementCopyAttributeValue(self, "AXPosition" as CFString, &value)
        
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
}
