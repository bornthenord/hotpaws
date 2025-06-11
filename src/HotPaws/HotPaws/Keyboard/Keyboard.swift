//
//  Keyboard.swift
//  HotPaws
//
//  Created by cat dog on 14.04.2025.
//
import Cocoa

struct Keyboard {
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
