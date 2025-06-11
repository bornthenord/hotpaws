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
        keyDownEvent.subscribe(type: CGEventType.keyDown, handler: keyDownEventHandler)
        
        try Config.load()
    }
}

private func keyDownEventHandler(
    _: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
        if let event = NSEvent(cgEvent: cgEvent),
           
           !event.modifierFlags.isEmpty || Config.mapping.keys.contains(.general) {
            
            if let key = Key(rawValue: event.keyCode) {
                var pressedModfifers = event.modifierFlags.getPressedModifiers()
                
                if Config.mapping.keys.contains(.general){
                    pressedModfifers.insert(.general)
                }
                
                for switchModifier in pressedModfifers {
                    if let layer = Config.mapping[switchModifier] {
                        if let mapping = layer[key] {
                            
                            pressedModfifers.remove(switchModifier)
                            
                            if mapping.modifiers != nil{
                                pressedModfifers = pressedModfifers.union(mapping.modifiers!)
                            }
                            
                            Keyboard.press(keys: mapping.targets, modifiers: pressedModfifers)
                            
                            return nil
                        }
                    }
                }
            }
        }
        
        return Unmanaged.passUnretained(cgEvent)
    }
