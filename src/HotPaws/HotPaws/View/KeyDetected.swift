//
//  KeyDetectedView.swift
//  HotPaws
//
//  Created by cat dog on 09.06.2025.
//

import Foundation
import AppKit

class KeyDetected : ButtonHandler, ModifierHandler {
    let name: String = "KeyDetected"
    
    public static var textView: NSTextFieldCell?
    
    init(textView: NSTextFieldCell) {
        KeyDetected.textView = textView
        Keyboard.keySubscribers[name] = self
        Keyboard.modifierChangeSubscribers[name] = self
    }
    
    func close() {
        Keyboard.keySubscribers.removeValue(forKey: name)
        Keyboard.modifierChangeSubscribers.removeValue(forKey: name)
    }
    
    func handle(button: inout Button, modifiers: inout Set<Button>) -> HandlerResult {
        if KeyDetected.textView?.isAccessibilityFocused() == true {
            KeyDetected.textView!.stringValue = button.description
        }
        
        return .skipped
    }
    
    func handle(modifiers: inout Set<Button>) -> HandlerResult {
        if KeyDetected.textView?.isAccessibilityFocused() == true {
            if let desc = modifiers.first?.description {
                KeyDetected.textView!.stringValue = desc
            }
        }
        
        return .skipped
    }
}
