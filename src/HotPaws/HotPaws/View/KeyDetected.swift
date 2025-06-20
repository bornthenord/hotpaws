//
//  KeyDetectedView.swift
//  HotPaws
//
//  Created by cat dog on 09.06.2025.
//

import Foundation
import AppKit

class KeyDetected : KeyHandler, ModifierChangeHandler {
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
    
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> Bool {
        if KeyDetected.textView?.isAccessibilityFocused() == true {
            KeyDetected.textView!.stringValue = key.description
        }
        
        return true
    }
    
    func handle(modifiers: inout Set<Modifier>) -> Bool {
        if KeyDetected.textView?.isAccessibilityFocused() == true {
            if let desc = modifiers.first?.description {
                KeyDetected.textView!.stringValue = desc
            }
        }
        
        return true
    }
}
