//
//  GeneralSectionHandler.swift
//  HotPaws
//
//  Created by cat dog on 11.06.2025.
//


import Cocoa

class GeneralSectionHandler : ButtonHandler {
    let decorated: ButtonHandler
    
    init(_ decorated: ButtonHandler){
        self.decorated = decorated
    }
    
    func handle(button: inout Button, modifiers: inout Set<Button>) -> HandlerResult {
        if Config.mapping.keys.contains(.general) {
            modifiers.insert(.general)
        }
        
        return self.decorated.handle(button: &button, modifiers: &modifiers)
    }
}
