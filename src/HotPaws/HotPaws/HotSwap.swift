//
//  HotPaws.swift
//  HotPaws
//
//  Created by cat dog on 14.04.2025.
//

import Cocoa


struct HotSwap {
    
    init() throws {
        try Config.load()
        try Keyboard.connect()
        
        Keyboard.handlers.append(DefaultSectionHandler())
    }
}

struct DefaultSectionHandler : KeyDownHandler {
    func handle(key: Key, modifiers: Set<Modifier>?) -> Bool {
        var pressedModifers: Set<Modifier>?
        
        if (modifiers != nil) {
            pressedModifers = modifiers
        }
        
        if Config.mapping.keys.contains(.general) {
            if (pressedModifers == nil) {
                pressedModifers = Set<Modifier>(minimumCapacity: 1)
            }
            
            pressedModifers!.insert(.general)
        }
        
        if pressedModifers != nil {
            for switchModifier in pressedModifers! {
                if let layer = Config.mapping[switchModifier] {
                    if let mapping = layer[key] {
                        pressedModifers!.remove(switchModifier)
                        
                        if mapping.modifiers != nil {
                            pressedModifers = pressedModifers?.union(mapping.modifiers!)
                        }
                        
                        Keyboard.press(keys: mapping.targets, modifiers: pressedModifers)
                        
                        return false
                    }
                }
            }
        }
        
        return true
    }
}
