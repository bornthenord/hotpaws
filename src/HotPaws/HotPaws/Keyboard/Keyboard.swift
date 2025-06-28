//
//  Keyboard.swift
//  HotPaws
//
//  Created by cat dog on 14.04.2025.
//
import Cocoa

enum KeyHandlerResult: String {
    case handled
    case skip
}

protocol KeyHandler {
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> KeyHandlerResult
}

protocol ModifierChangeHandler {
    func handle(modifiers: inout Set<Modifier>) -> KeyHandlerResult
}

struct KeyQueueItem {
    let key: Key
    let modifiers: Set<Modifier>?
    let date: Date
}

struct Keyboard {
    private static let keyDownEvent: Event = Event()
    private static let flagsChangedEvent: Event = Event()
    public static var isPressProgrammatic: Bool = false
    
    public static var keySubscribers: Dictionary<String,KeyHandler> = [:]
    public static var modifierChangeSubscribers: Dictionary<String,ModifierChangeHandler> = [:]
    
    public static func connect() throws {
        keyDownEvent.subscribe(type: CGEventType.keyDown, handler: keyDownHandler)
        flagsChangedEvent.subscribe(type: CGEventType.flagsChanged, handler: modifierChangeHandler)
    }
    
    public static func press(key: Key, modifiers: Set<Modifier>?) {
        isPressProgrammatic = true
        down(key: key, modifiers: modifiers)
        up(key: key)
    }
    
    private static func up(key: Key) {
        let up = CGEvent(keyboardEventSource: nil, virtualKey: key.rawValue, keyDown: false)
        up?.post(tap: .cghidEventTap)
    }
    
    private static func down(key: Key, modifiers: Set<Modifier>?) {
        var flags: CGEventFlags?
        
        if (modifiers != nil) {
            flags = modifiers!.toFlags()
        }
        
        let down = CGEvent(keyboardEventSource: nil, virtualKey: key.rawValue, keyDown: true)
        
        if (flags != nil) {
            down?.flags = flags!
        }
        
        down?.post(tap: .cghidEventTap)
    }
}

private func keyDownHandler(_: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    if !Keyboard.isPressProgrammatic {
        if let event = NSEvent(cgEvent: cgEvent) {
            if var key = Key(rawValue: event.keyCode) {
                var modifiers: Set<Modifier>?
                
                if !event.modifierFlags.isEmpty {
                    modifiers = event.modifierFlags.toModifiers()
                } else {
                    modifiers = []
                }
                
                for handler in Keyboard.keySubscribers.values {
                    if handler.handle(key: &key, modifiers: &modifiers!) == .handled {
                        return nil
                    }
                }
            }
        }
    } else {
        Keyboard.isPressProgrammatic = false
    }
    
    return Unmanaged.passUnretained(cgEvent)
}

private func modifierChangeHandler(_: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    if let event = NSEvent(cgEvent: cgEvent) {
        
        var presedModifier = event.modifierFlags.toModifiers()
        
        for handler in Keyboard.modifierChangeSubscribers.values {
            if handler.handle(modifiers: &presedModifier) == .handled {
                return nil
            }
        }
    }
    
    return Unmanaged.passUnretained(cgEvent)
}
