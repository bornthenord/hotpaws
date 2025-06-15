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
    
    public static func left() {
        let currentLocation = NSEvent.mouseLocation
        let point = CGPoint(x: currentLocation.x + 1, y: currentLocation.y + 1)
        
        let event = CGEvent(mouseEventSource: nil, mouseType: CGEventType.mouseMoved, mouseCursorPosition: point, mouseButton: .left)
        
        event?.post(tap: CGEventTapLocation.cghidEventTap)
    }
    
    public static func up() {
    }
    
    public static func down() {
    }
    
    public static func right() {
    }

    public static func rightClick() {
    }
    
    public static func leftClick() {
    }
}

private func leftMouseDownHandler(_: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    if let event = NSEvent(cgEvent: cgEvent) {
        if event.type == .leftMouseDown {
            var btn = Button.mouseLeft
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
            var btn = Button.mouseRight
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
