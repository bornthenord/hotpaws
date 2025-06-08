//
//  Keyboard.swift
//  HotPaws
//
//  Created by cat dog on 14.04.2025.
//
import Cocoa

struct Keyboard {
    public static func press(keys: [Key], modifiers: [Modifier]?) {
        
        down(keys: keys, modifiers: modifiers)
        
        up(keys: keys)
    }
    
    public static func up(keys: [Key]) {
        for key in keys {
            let up = CGEvent(keyboardEventSource: nil, virtualKey: key.rawValue, keyDown: false)
            up?.post(tap: .cghidEventTap)
        }
    }
    
    public static func down(keys: [Key], modifiers: [Modifier]?)
    {
        var flags: CGEventFlags = []
        
        if (modifiers != nil) {
            for modifier in modifiers! {
                switch modifier {
                case .shift:
                    flags.insert(.maskShift)
                case .rightShift:
                    flags.insert(.maskShift)
                    
                case .control:
                    flags.insert(.maskControl)
                case .rightControl:
                    flags.insert(.maskControl)
                    
                case .option:
                    flags.insert(.maskAlternate)
                case .rightOption:
                    flags.insert(.maskAlternate)
                    
                case .command:
                    flags.insert(.maskCommand)
                case .rightCommand:
                    flags.insert(.maskCommand)
                case .function:
                    break
                case .capsLock:
                    break
                }
            }
        }
        
        for key in keys {
            let down = CGEvent(keyboardEventSource: nil, virtualKey: key.rawValue, keyDown: true)
            
            down?.flags = flags
            
            down?.post(tap: .cghidEventTap)
        }
    }
}
