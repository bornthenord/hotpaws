//
//  Keyborg.swift
//  Keyborg
//
//  Created by cat dog on 14.04.2025.
//

import Cocoa

struct Keyborg {
    private let keyDownEvent: KeyDownEvent?
    
    init() {
        keyDownEvent = KeyDownEvent()
        keyDownEvent?.subscribe(handler: handleKeyDown)
    }
}

private func handleKeyDown(
    _: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
        if let event = NSEvent(cgEvent: cgEvent),
           event.modifierFlags.contains(.capsLock) {
            if let key = Key(rawValue: event.keyCode) {
                if let item = Map[key] {
                    Keyboard.press(keys: item.Keys, modifiers: item.Modifiers)
                    return nil
                }
            }
        }
    
    return Unmanaged.passUnretained(cgEvent)
}
