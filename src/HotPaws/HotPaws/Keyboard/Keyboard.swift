//
//  Keyboard.swift
//  HotPaws
//
//  Created by cat dog on 14.04.2025.
//
import Cocoa

protocol KeyDownHandler {
    func handle(key: Key, modifiers: Set<Modifier>?) -> Bool
}

protocol KeyUpHandler {
    func handle(key: Key) -> Bool
}

struct Keyboard {
    
    private static let keyDownEvent: Event = Event()
    public static var handlers: [KeyDownHandler] = []
    
    public static func connect() throws {
        keyDownEvent.subscribe(type: CGEventType.keyDown, handler: keyDownHandler)
    }
        
    public static func press(keys: Set<Key>, modifiers: Set<Modifier>?) {
        down(keys: keys, modifiers: modifiers)
        up(keys: keys)
    }
    
    private static func up(keys: Set<Key>) {
        for key in keys {
            let up = CGEvent(keyboardEventSource: nil, virtualKey: key.rawValue, keyDown: false)
            up?.post(tap: .cghidEventTap)
        }
    }
    
    private static func down(keys: Set<Key>, modifiers: Set<Modifier>?) {
        var flags: CGEventFlags?
        
        if (modifiers != nil) {
            flags = modifiers!.toFlags()
        }
        
        for key in keys {
            let down = CGEvent(keyboardEventSource: nil, virtualKey: key.rawValue, keyDown: true)
            
            if (flags != nil) {
                down?.flags = flags!
            }
            
            down?.post(tap: .cghidEventTap)
        }
    }
}

private func keyDownHandler(_: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    if let event = NSEvent(cgEvent: cgEvent) {
        if let key = Key(rawValue: event.keyCode) {
            var modifiers: Set<Modifier>?
            
            if !event.modifierFlags.isEmpty {
                modifiers = event.modifierFlags.toModifiers()
            }
            
            var handled = true
            
            for handler in Keyboard.handlers {
                if !handler.handle(key: key, modifiers: modifiers) {
                    handled = false
                }
            }
            
            if !handled {
                return nil
            }
        }
    }
    
    return Unmanaged.passUnretained(cgEvent)
}
