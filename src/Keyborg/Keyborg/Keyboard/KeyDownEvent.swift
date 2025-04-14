//
//  KeyDownEvent.swift
//  keyborg
//
//  Created by cat dog on 14.04.2025.
//

import Cocoa

class KeyDownEvent {
    private var eventTap: CFMachPort?
    
    public func subscribe(handler: CGEventTapCallBack) {
        let eventMask = (1 << CGEventType.keyDown.rawValue)
        if let tap = CGEvent.tapCreate(
            tap: .cgSessionEventTap,
            place: .headInsertEventTap,
            options: .defaultTap,
            eventsOfInterest: CGEventMask(eventMask),
            callback: handler,
            userInfo: nil
        ) {
            eventTap = tap
            let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, tap, 0)
            CFRunLoopAddSource(CFRunLoopGetMain(), runLoopSource, .commonModes)
            CGEvent.tapEnable(tap: tap, enable: true)
        } else {
            print("Failed to create event tap.")
        }
    }
}
