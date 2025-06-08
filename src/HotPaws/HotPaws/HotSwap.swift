//
//  HotPaws.swift
//  HotPaws
//
//  Created by cat dog on 14.04.2025.
//

import Cocoa

struct HotSwap {
    private let keyDownEvent: Event?
    
    public static var mapping: [Key: (Keys: [Key], Modifiers: [Modifier]?)]?
    public static var controlKey: Modifier {
        get {
            return Config.controlKey
        }
    }
    
    init() throws {
        keyDownEvent = Event()
        keyDownEvent?.subscribe(type: CGEventType.keyDown, handler: handleKeyDown)
        
        HotSwap.mapping = try ConfigParser.parse(Config.mapping)
    }
}

private func handleKeyDown(
    _: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
        if let event = NSEvent(cgEvent: cgEvent),
           isControlKeyPressed(flags: event.modifierFlags) {
            
            let pressedModfifers = getPressedModifiers(flags: event.modifierFlags)
            
            if let key = Key(rawValue: event.keyCode) {
                if let item = HotSwap.mapping?[key] {
                    let modifiers = mergeModifiers(left: pressedModfifers, right: item.Modifiers)
                    
                    Keyboard.press(keys: item.Keys, modifiers: modifiers)
                    
                    return nil
                }
            }
        }
        
        return Unmanaged.passUnretained(cgEvent)
    }

private func isControlKeyPressed(flags: NSEvent.ModifierFlags) -> Bool {
    return flags.contains(.capsLock) && HotSwap.controlKey == .capsLock ||
    flags.contains(.shift) && HotSwap.controlKey == .shift ||
    flags.contains(.function) && HotSwap.controlKey == .function ||
    flags.contains(.control) && HotSwap.controlKey == .control ||
    flags.contains(.option) && HotSwap.controlKey == .option ||
    flags.contains(.command) && HotSwap.controlKey == .command ||
    flags.contains(.command) && flags.rawValue == 1048848 && HotSwap.controlKey == .rightCommand ||
    flags.contains(.option) && flags.rawValue == 524608 && HotSwap.controlKey == .rightOption ||
    flags.contains(.shift) && flags.rawValue == 131332 && HotSwap.controlKey == .rightShift
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
