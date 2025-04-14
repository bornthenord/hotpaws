//
//  Keyboard.swift
//  keyborg
//
//  Created by cat dog on 14.04.2025.
//
import Cocoa

struct Keyboard {
    public static func press(keys: [Key], modifiers: [Modifier]?) {
        for key in keys {
            let down = CGEvent(keyboardEventSource: nil, virtualKey: key.rawValue, keyDown: true)
            
            if (modifiers != nil) {
                for modifier in modifiers! {
                    switch modifier {
                    case .shift:
                        down?.flags.insert(.maskShift)
                    case .control:
                        down?.flags.insert(.maskControl)
                    case .option:
                        down?.flags.insert(.maskAlternate)
                    case .command:
                        down?.flags.insert(.maskCommand)
                    }
                }
                
                down?.post(tap: .cghidEventTap)
            }
        }
        
        for key in keys {
            let up = CGEvent(keyboardEventSource: nil, virtualKey: key.rawValue, keyDown: false)
            up?.post(tap: .cghidEventTap)
        }
    }
}
