//
//  HotPaws.swift
//  HotPaws
//
//  Created by cat dog on 14.04.2025.
//

import Cocoa

struct HotSwap {
    private let keyDownEvent: Event = Event()
    private let keyUpEvent: Event = Event()

    public static let ReservedKeys: Set<Key> = [.space]
    public static var config: [Key: (Keys: [Key], Modifiers: [Modifier]?)]?
   
    public static var skipSpaceDown: Bool = true
    public static var lastSpaceDownDate: Date? = nil
    public static var spaceIsDown: Bool = false
    
    init() throws {
        keyDownEvent.subscribe(type: CGEventType.keyDown, handler: handleKeyDown)
        keyUpEvent.subscribe(type: CGEventType.keyUp, handler: handleKeyUp)
        
        HotSwap.config = try Parser.parse(Repository.config)
    }
}

private func handleKeyUp(
    _: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
        if let event = NSEvent(cgEvent: cgEvent),
           let key = Key(rawValue: event.keyCode) {
            if key == Key.space{
                HotSwap.spaceIsDown = false
                
                let diff = Date().timeIntervalSince(HotSwap.lastSpaceDownDate!)
                HotSwap.lastSpaceDownDate = nil
                
                if diff < 0.1 {
                    HotSwap.skipSpaceDown = false
                    Keyboard.down(keys: [Key.space], modifiers: nil)
                } else {
                    return nil
                }
            }
        }
        
        return Unmanaged.passUnretained(cgEvent)
    }

private func handleKeyDown(
    _: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
        if let event = NSEvent(cgEvent: cgEvent),
           let key = Key(rawValue: event.keyCode) {
            if key == Key.space {
                HotSwap.spaceIsDown = true
                
                if HotSwap.lastSpaceDownDate == nil {
                    HotSwap.lastSpaceDownDate = Date()
                }
                
                if HotSwap.skipSpaceDown {
                    return nil
                }
                
                HotSwap.lastSpaceDownDate = nil
                HotSwap.skipSpaceDown = true
            }
            
            if HotSwap.spaceIsDown {
                let pressedModfifers = getPressedModifiers(flags: event.modifierFlags)
                
                if let item = HotSwap.config?[key] {
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
