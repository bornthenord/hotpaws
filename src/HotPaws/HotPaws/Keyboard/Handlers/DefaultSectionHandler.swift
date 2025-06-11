//
//  DefaultSectionHandler.swift
//  HotPaws
//
//  Created by cat dog on 11.06.2025.
//


import Cocoa

struct DefaultSectionHandler : KeyDownHandler {
    let decorated: KeyDownHandler
    
    init (_ decorated: KeyDownHandler) {
        self.decorated = decorated
    }
    
    func handle(key: Key, modifiers: inout Set<Modifier>) -> Bool {
        if Config.mapping.keys.contains(.general) {
            modifiers.insert(.general)
        }
        
        return self.decorated.handle(key: key, modifiers: &modifiers)
    }
}
