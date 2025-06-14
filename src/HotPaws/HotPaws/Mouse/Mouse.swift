//
//  Mouse.swift
//  HotPaws
//
//  Created by cat dog on 14.06.2025.
//

import Foundation
import Cocoa

struct Mouse {
    public static func moveLeft() {
        let currentLocation = NSEvent.mouseLocation
        let point = CGPoint(x: currentLocation.x + 1, y: currentLocation.y + 1)
        
        let event = CGEvent(mouseEventSource: nil, mouseType: CGEventType.mouseMoved, mouseCursorPosition: point, mouseButton: .left)
        
        event?.post(tap: CGEventTapLocation.cghidEventTap)
    }
    
    public static func moveUp() {
    }
    
    public static func moveDown() {
    }
    
    public static func moveRight() {
    }

    public static func rightClick() {
    }
    
    public static func leftClick() {
    }
}
