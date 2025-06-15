//
//  Mouse.swift
//  HotPaws
//
//  Created by cat dog on 14.06.2025.
//

import Foundation
import Cocoa

struct Mouse {
    private static let leftMouseDownEvent: Event = Event()
    private static let rightMouseDownEvent: Event = Event()
    private static let mouseMoveEvent: Event = Event()
    
    public static var buttonSubscribers: Dictionary<String,ButtonHandler> = [:]
    
    public static func connect() throws {
        leftMouseDownEvent.subscribe(type: CGEventType.leftMouseDown, handler: leftMouseDownHandler)
        rightMouseDownEvent.subscribe(type: CGEventType.rightMouseDown, handler: rightMouseDownHandler)
        mouseMoveEvent.subscribe(type: CGEventType.mouseMoved, handler: mouseMoveHandler)
    }
    
    public static func left(_ pixels: CGFloat) {
        let currentPosition = getCurrentMousePosition()
        
        move(x: currentPosition.x - pixels, y: currentPosition.y)
    }
    
    public static func up(_ pixels: CGFloat) {
        let currentPosition = getCurrentMousePosition()
        
        move(x: currentPosition.x, y: currentPosition.y + pixels)
    }
    
    public static func down(_ pixels: CGFloat) {
        let currentPosition = getCurrentMousePosition()
        
        move(x: currentPosition.x, y: currentPosition.y - pixels)
    }
    
    public static func right(_ pixels: CGFloat) {
        let currentPosition = getCurrentMousePosition()
        
        move(x: currentPosition.x + pixels, y: currentPosition.y)
    }

    public static func rightClick() {
        btnDown(false)
        btnUp(false)
        print("rightClick")
    }
    
    public static func leftClick() {
        btnDown(true)
        btnUp(true)
        print("leftClick")
    }
    
    private static func getCurrentMousePosition() -> CGPoint {
        return CGEvent(source: nil)?.location ?? CGPoint.zero
    }
    
    private static func move(x: Double, y: Double) {
        let newPosition = CGPoint(x: x, y: y)
        
        if let moveEvent = CGEvent(mouseEventSource: nil, mouseType: .mouseMoved, mouseCursorPosition: newPosition, mouseButton: .left) {
            moveEvent.post(tap: .cghidEventTap)
        }
    }
    
    private static func btnDown(_ isLeft: Bool) {
        let currentPosition = getCurrentMousePosition()
        var mouseType = CGEventType.leftMouseDown
        var mouseButton = CGMouseButton.left
        
        if !isLeft {
            mouseType = .rightMouseDown
            mouseButton = CGMouseButton.right
        }
        
        if let event = CGEvent(mouseEventSource: nil,
                               mouseType: mouseType,
                               mouseCursorPosition: currentPosition,
                               mouseButton: mouseButton) {
            event.post(tap: .cghidEventTap)
        }
    }
    
    private static func btnUp(_ isLeft: Bool) {
        let currentPosition = getCurrentMousePosition()
        var mouseType = CGEventType.leftMouseUp
        var mouseButton = CGMouseButton.left
        
        if !isLeft {
            mouseType = .rightMouseUp
            mouseButton = CGMouseButton.right
        }
        
        if let event = CGEvent(mouseEventSource: nil,
                               mouseType: mouseType,
                               mouseCursorPosition: currentPosition,
                               mouseButton: mouseButton) {
            event.post(tap: .cghidEventTap)
        }
    }
}

private func leftMouseDownHandler(_: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    if let event = NSEvent(cgEvent: cgEvent) {
        if event.type == .leftMouseDown {
            var btn = Button.mouseRightClick
            var modifiers = Set<Button>()
            
            for handler in Mouse.buttonSubscribers.values {
                if handler.handle(button: &btn, modifiers: &modifiers) == .handled {
                    return nil
                }
            }
        }
    }
    
    return Unmanaged.passUnretained(cgEvent)
}

private func rightMouseDownHandler(_: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    if let event = NSEvent(cgEvent: cgEvent) {
        if event.type == .rightMouseDown {
            var btn = Button.mouseRightClick
            var modifiers = Set<Button>()
            
            for handler in Mouse.buttonSubscribers.values {
                if handler.handle(button: &btn, modifiers: &modifiers) == .handled {
                    return nil
                }
            }
        }
    }
    
    return Unmanaged.passUnretained(cgEvent)
}

private func mouseMoveHandler(_: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    if let event = NSEvent(cgEvent: cgEvent) {
        if event.type == .mouseMoved {
            var btn = Button.mouseMove
            var modifiers = Set<Button>()
            
            for handler in Mouse.buttonSubscribers.values {
                if handler.handle(button: &btn, modifiers: &modifiers) == .handled {
                    return nil
                }
            }
        }
    }
    
    return Unmanaged.passUnretained(cgEvent)
}
