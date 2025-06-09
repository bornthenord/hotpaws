//
//  HotPaws.swift
//  HotPaws
//
//  Created by cat dog on 14.04.2025.
//

import Cocoa

struct HotSwap {
    private let keyDownEvent: Event = Event()
    
    public static var mapping: [Key: (Keys: [Key], Modifiers: [Modifier]?)]?
    
    public static var controlKey: Modifier {
        get {
            return Config.controlKey
        }
    }
    
    init() throws {
        keyDownEvent.subscribe(type: CGEventType.keyDown, handler: handleKeyDown)
        
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
    return (flags.contains(.capsLock) && HotSwap.controlKey == .capsLock) ||
    (flags.contains(.function) && HotSwap.controlKey == .function) ||
    (flags.contains(.shift) && HotSwap.controlKey == .shift) ||
    (flags.contains(.control) && HotSwap.controlKey == .control) ||
    (flags.contains(.option) && HotSwap.controlKey == .option) ||
    (flags.contains(.command) && HotSwap.controlKey == .command) ||
    (flags.containsRightCommand() && HotSwap.controlKey == .rightCommand) ||
    (flags.containsRightOption() && HotSwap.controlKey == .rightOption) ||
    (flags.containsRightShift() && HotSwap.controlKey == .rightShift)
}

private func getPressedModifiers(flags: NSEvent.ModifierFlags) -> [Modifier]? {
    var result : [Modifier]?
    
    if flags.contains(.shift) && HotSwap.controlKey != .shift {
        if result == nil {
            result = [.shift]
        } else {
            result?.append(.shift)
        }
    }
    
    if flags.containsRightShift() && HotSwap.controlKey != .rightShift {
        if result == nil {
            result = [.rightShift]
        } else {
            result?.append(.rightShift)
        }
    }
    
    if flags.contains(.control) && HotSwap.controlKey != .control {
        if result == nil {
            result = [.control]
        } else {
            result?.append(.control)
        }
    }
    
    if flags.contains(.option) && HotSwap.controlKey != .option{
        if result == nil {
            result = [.option]
        } else {
            result?.append(.option)
        }
    }
    
    if flags.containsRightOption() && HotSwap.controlKey != .rightOption{
        if result == nil {
            result = [.rightOption]
        } else {
            result?.append(.rightOption)
        }
    }
    
    if flags.contains(.command) && HotSwap.controlKey != .command {
        if result == nil {
            result = [.command]
        } else {
            result?.append(.command)
        }
    }
    
    if flags.containsRightCommand() && HotSwap.controlKey != .rightCommand {
        if result == nil {
            result = [.rightCommand]
        } else {
            result?.append(.rightCommand)
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
