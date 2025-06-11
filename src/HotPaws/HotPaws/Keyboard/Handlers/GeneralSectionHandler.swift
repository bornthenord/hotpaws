//
//  DefaultSectionHandler.swift
//  HotPaws
//
//  Created by cat dog on 11.06.2025.
//


import Cocoa

struct GeneralSectionHandler : KeyHandler {
    
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> Bool {
        if Config.mapping.keys.contains(.general) {
            modifiers.insert(.general)
        }
        
        return true
    }
}
