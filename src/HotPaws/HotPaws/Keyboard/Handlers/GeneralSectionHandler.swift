//
//  DefaultSectionHandler.swift
//  HotPaws
//
//  Created by cat dog on 11.06.2025.
//


import Cocoa

class GeneralSectionHandler: ClickHandler {
    let decorated: ClickHandler
    
    init(_ decorated: ClickHandler){
        self.decorated = decorated
    }
    
    func handle(_ click: Click, modifiers: inout Set<Modifier>) -> HandlerResult {
        if Config.mapping.rules.keys.contains(.general) {
            modifiers.insert(.general)
        }
        
        return self.decorated.handle(click, modifiers: &modifiers)
    }
}
