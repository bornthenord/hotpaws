//
//  Keyborg.swift
//  Keyborg
//
//  Created by cat dog on 14.04.2025.
//

import Cocoa

struct Keyborg {
    private let keyDownEvent: Event?
    
    public static var config: [Key: (Keys: [Key], Modifiers: [Modifier]?)]?
    
    init() throws {
        keyDownEvent = Event()
        keyDownEvent?.subscribe(type: CGEventType.keyDown, handler: handleKeyDown)
        
        Keyborg.config = try Parser.parse(Repository.config)
    }
}

private func handleKeyDown(
    _: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
        if let event = NSEvent(cgEvent: cgEvent),
           event.modifierFlags.contains(.capsLock) {
            
            let pressedModfifers = getPressedModifiers(flags: event.modifierFlags)
            
            if let key = Key(rawValue: event.keyCode) {
                if let item = Keyborg.config?[key] {
                    let modifiers = mergeModifiers(left: pressedModfifers, right: item.Modifiers)
                    
                    Keyboard.press(keys: item.Keys, modifiers: modifiers)
                    
                    return nil
                }
            }
        }
    
    return Unmanaged.passUnretained(cgEvent)
}

private func getPressedModifiers(flags: NSEvent.ModifierFlags) -> [Modifier]? {
    var result : [Modifier]?
    
    if flags.contains(.shift) {
        if result == nil {
            result = [.shift]
        } else {
            result?.append(.shift)
        }
    }
    
    if flags.contains(.control) {
        if result == nil {
            result = [.control]
        } else {
            result?.append(.control)
        }
    }
    
    if flags.contains(.option) {
        if result == nil {
            result = [.option]
        } else {
            result?.append(.option)
        }
    }
    
    if flags.contains(.command) {
        if result == nil {
            result = [.command]
        } else {
            result?.append(.command)
        }
    }
    
    return result
}

private func mergeModifiers(left: [Modifier]?, right: [Modifier]?) -> [Modifier]? {
    if left == nil {
        return right
    }
    
    if right == nil {
        return left
    }
    
    return left! + right!
}
