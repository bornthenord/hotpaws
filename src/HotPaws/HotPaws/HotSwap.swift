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
           
            let key = Key(rawValue: event.keyCode) {
            
            if let item = Config.mapping[key] {
                
                var pressedModfifers = event.modifierFlags.getPressedModifiers()
                
                if pressedModfifers.contains(Config.controlKey) == true {
                    
                    pressedModfifers.remove(Config.controlKey)
                    
                    if item.modifiers != nil{
                        pressedModfifers = pressedModfifers.union(item.modifiers!)
                    }
                    
                    Keyboard.press(keys: item.targetKeys, modifiers: pressedModfifers)
                    
                    return nil
                }
            }
        }
        
        return Unmanaged.passUnretained(cgEvent)
    }
