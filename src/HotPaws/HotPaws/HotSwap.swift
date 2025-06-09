//
//  HotPaws.swift
//  HotPaws
//
//  Created by cat dog on 14.04.2025.
//

import Cocoa

struct HotSwap {
    private let keyDownEvent: Event = Event()
    
    init() throws {
        keyDownEvent.subscribe(type: CGEventType.keyDown, handler: handleKeyDown)
        
        try Config.load()
    }
}

private func handleKeyDown(
    _: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
        if let event = NSEvent(cgEvent: cgEvent),
           isControlKeyPressed(flags: event.modifierFlags) {
            
            let pressedModfifers = getPressedModifiers(flags: event.modifierFlags)
            
            if let key = Key(rawValue: event.keyCode) {
                if let item = Config.mapping[key] {
                    let modifiers = mergeModifiers(left: pressedModfifers, right: item.Modifiers)
                    
                    Keyboard.press(keys: item.Keys, modifiers: modifiers)
                    
                    return nil
                }
            }
        }
        
        return Unmanaged.passUnretained(cgEvent)
    }

private func isControlKeyPressed(flags: NSEvent.ModifierFlags) -> Bool {
    return (flags.contains(.capsLock) && Config.controlKey == .capsLock) ||
    (flags.contains(.function) && Config.controlKey == .function) ||
    (flags.contains(.shift) && Config.controlKey == .shift) ||
    (flags.contains(.control) && Config.controlKey == .control) ||
    (flags.contains(.option) && Config.controlKey == .option) ||
    (flags.contains(.command) && Config.controlKey == .command) ||
    (flags.containsRightCommand() && Config.controlKey == .rightCommand) ||
    (flags.containsRightOption() && Config.controlKey == .rightOption) ||
    (flags.containsRightShift() && Config.controlKey == .rightShift)
}

private func getPressedModifiers(flags: NSEvent.ModifierFlags) -> [Modifier]? {
    var result : [Modifier]?
    
    if flags.contains(.shift) && Config.controlKey != .shift {
        if result == nil {
            result = [.shift]
        } else {
            result?.append(.shift)
        }
    }
    
    if flags.containsRightShift() && Config.controlKey != .rightShift {
        if result == nil {
            result = [.rightShift]
        } else {
            result?.append(.rightShift)
        }
    }
    
    if flags.contains(.control) && Config.controlKey != .control {
        if result == nil {
            result = [.control]
        } else {
            result?.append(.control)
        }
    }
    
    if flags.contains(.option) && Config.controlKey != .option{
        if result == nil {
            result = [.option]
        } else {
            result?.append(.option)
        }
    }
    
    if flags.containsRightOption() && Config.controlKey != .rightOption{
        if result == nil {
            result = [.rightOption]
        } else {
            result?.append(.rightOption)
        }
    }
    
    if flags.contains(.command) && Config.controlKey != .command {
        if result == nil {
            result = [.command]
        } else {
            result?.append(.command)
        }
    }
    
    if flags.containsRightCommand() && Config.controlKey != .rightCommand {
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
