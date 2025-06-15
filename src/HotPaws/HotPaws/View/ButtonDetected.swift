//
//  KeyDetectedView.swift
//  HotPaws
//
//  Created by cat dog on 09.06.2025.
//

import Foundation
import AppKit

class ButtonDetected : ButtonHandler, ModifierHandler {
    let name: String = "ButtonDetected"
    
    public static var textView: NSTextFieldCell?
    
    init(textView: NSTextFieldCell) {
        ButtonDetected.textView = textView
        Keyboard.keySubscribers[name] = self
        Keyboard.modifierChangeSubscribers[name] = self
        Mouse.buttonSubscribers[name] = self
    }
    
    func close() {
        Keyboard.keySubscribers.removeValue(forKey: name)
        Keyboard.modifierChangeSubscribers.removeValue(forKey: name)
        Mouse.buttonSubscribers.removeValue(forKey: name)
    }
    
    func handle(button: inout Button, modifiers: inout Set<Button>) -> HandlerResult {
        if ButtonDetected.textView?.isAccessibilityFocused() == true {
            ButtonDetected.textView!.stringValue = button.description
        }
        
        return .skipped
    }
    
    func handle(modifiers: inout Set<Button>) -> HandlerResult {
        if ButtonDetected.textView?.isAccessibilityFocused() == true {
            if let desc = modifiers.first?.description {
                ButtonDetected.textView!.stringValue = desc
            }
        }
        
        return .handled
    }
}
