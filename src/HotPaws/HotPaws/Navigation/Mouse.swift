//
//  Mouse.swift
//  HotPaws
//
//  Created by cat dog on 21.06.2025.
//

import Foundation
import Cocoa

class Mouse {
    static func leftClick(at point: CGPoint) {
        if let mouseDown = CGEvent(mouseEventSource: nil, mouseType: .leftMouseDown, mouseCursorPosition: point, mouseButton: .left) {
            if let mouseUp = CGEvent(mouseEventSource: nil, mouseType: .leftMouseUp, mouseCursorPosition: point, mouseButton: .left) {
                mouseDown.post(tap: .cghidEventTap)
                usleep(100_000) // задержка 100 мс
                mouseUp.post(tap: .cghidEventTap)
            }
        }
    }
    
    static func rightClick(at point: CGPoint) {
        if let mouseDown = CGEvent(mouseEventSource: nil, mouseType: .rightMouseDown, mouseCursorPosition: point, mouseButton: .right) {
            if let mouseUp = CGEvent(mouseEventSource: nil, mouseType: .rightMouseUp, mouseCursorPosition: point, mouseButton: .right) {
                mouseDown.post(tap: .cghidEventTap)
                usleep(100_000) // задержка 100 мс
                mouseUp.post(tap: .cghidEventTap)
            }
        }
    }
}
