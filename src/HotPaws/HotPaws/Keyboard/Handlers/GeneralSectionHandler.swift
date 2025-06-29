//
//  DefaultSectionHandler.swift
//  HotPaws
//
//  Created by cat dog on 11.06.2025.
//


import Cocoa

class GeneralSectionHandler: KeyHandler {
    let decorated: KeyHandler
    
    init(_ decorated: KeyHandler){
        self.decorated = decorated
    }
    
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> KeyHandlerResult {
        if Config.mapping.rules.keys.contains(.general) {
            modifiers.insert(.general)
        }
        
        return self.decorated.handle(key: &key, modifiers: &modifiers)
    }
}
