//
//  KeyDetectedView.swift
//  HotPaws
//
//  Created by cat dog on 09.06.2025.
//

import Foundation
import AppKit

class KeyDetected : ClickHandler, ModifierChangeHandler {
    let name: String = "KeyDetected"
    
    public static var textView: NSTextFieldCell?
    
    init(textView: NSTextFieldCell) {
        KeyDetected.textView = textView
        Keyboard.subscribers[name] = self
        Keyboard.modifierChangeSubscribers[name] = self
    }
    
    func close() {
        Keyboard.subscribers.removeValue(forKey: name)
        Keyboard.modifierChangeSubscribers.removeValue(forKey: name)
    }
    
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> HandlerResult {
        if KeyDetected.textView?.isAccessibilityFocused() == true {
            KeyDetected.textView!.stringValue = String(describing: key)
        }
        
        return .skip
    }
    
    func handle(modifiers: inout Set<Modifier>) -> HandlerResult {
        if KeyDetected.textView?.isAccessibilityFocused() == true {
            if let desc = modifiers.first {
                KeyDetected.textView!.stringValue = String(describing: desc)
            }
        }
        
        return .skip
    }
}
