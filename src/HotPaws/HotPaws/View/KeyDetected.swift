//
//  KeyDetectedView.swift
//  HotPaws
//
//  Created by cat dog on 09.06.2025.
//

import Foundation
import AppKit

class KeyDetected {
    
    private let keyUpEvent: Event = Event()
    private let modifierChangeEvent: Event = Event()
    
    public static var textView: NSTextFieldCell?
    
    init(textView: NSTextFieldCell) {
        KeyDetected.textView = textView
        
        keyUpEvent.subscribe(type: CGEventType.keyUp, handler: keyUpEventHandler)
        modifierChangeEvent.subscribe(type: CGEventType.flagsChanged, handler: modifierChangeEventHandler)
    }
}

private func keyUpEventHandler(
    _: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
        if KeyDetected.textView?.isAccessibilityFocused() == true {
            if let event = NSEvent(cgEvent: cgEvent) {
                var description: String = "unknown key"
                
                if let key = Key(rawValue: event.keyCode){
                    description = key.description
                }
                
                KeyDetected.textView!.stringValue = description
            }
        }
        
        return Unmanaged.passUnretained(cgEvent)
    }

private func modifierChangeEventHandler(
    _: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
        if KeyDetected.textView?.isAccessibilityFocused() == true {
            if let event = NSEvent(cgEvent: cgEvent) {
                var description: String = ""
                
                if let presedModifier = event.modifierFlags.toModifiers().first{
                    description = presedModifier.description
                }
                
                KeyDetected.textView!.stringValue = description
            }
        }
        
        return Unmanaged.passUnretained(cgEvent)
    }
