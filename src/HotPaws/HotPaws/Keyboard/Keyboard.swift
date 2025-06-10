//
//  Keyboard.swift
//  HotPaws
//
//  Created by cat dog on 14.04.2025.
//
import Cocoa

struct Keyboard {
    public static func press(keys: Set<Key>, modifiers: Set<Modifier>?) {
        
        var flags: CGEventFlags = []
        
        if (modifiers != nil) {
            for modifier in modifiers! {
                switch modifier {
                case .shift:
                    flags.insert(.maskShift)
                case .shiftr:
                    flags.insert(.maskShift)
                    
                case .ctrl:
                    flags.insert(.maskControl)
                    
                case .opt:
                    flags.insert(.maskAlternate)
                case .optr:
                    flags.insert(.maskAlternate)
                    
                case .cmd:
                    flags.insert(.maskCommand)
                case .cmdr:
                    flags.insert(.maskCommand)
                    
                case .fn:
                    continue
                case .capslock:
                    continue
                case .general:
                   continue
                }
            }
        }
        
        for key in keys {
            let down = CGEvent(keyboardEventSource: nil, virtualKey: key.rawValue, keyDown: true)
            
            down?.flags = flags
            
            down?.post(tap: .cghidEventTap)
        }
        
        for key in keys {
            let up = CGEvent(keyboardEventSource: nil, virtualKey: key.rawValue, keyDown: false)
            up?.post(tap: .cghidEventTap)
        }
    }
}
