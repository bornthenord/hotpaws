//
//  CapsLockIsOnOffHandler.swift
//  HotPaws
//
//  Created by cat dog on 13.06.2025.
//

import Foundation

class CapsLockIsOnOffHandler : KeyHandler {
    let decorated: KeyHandler
    
    init(_ decorated: KeyHandler){
        self.decorated = decorated
    }
    
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> Bool {
        if Config.capsLockIsOnOff && modifiers.contains(.capslock) || !Config.capsLockIsOnOff {
            return self.decorated.handle(key: &key, modifiers: &modifiers)
        }
        
        return false
    }
}
