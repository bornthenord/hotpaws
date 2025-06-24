//
//  ModeHandler.swift
//  HotPaws
//
//  Created by cat dog on 21.06.2025.
//

import Foundation

class NavigationHandler: KeyHandler {
    let decorated: KeyHandler
    let view = NavigationWindow()
    
    init(_ decorated: KeyHandler){
        self.decorated = decorated
    }
    
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> Bool {
        if key == .f {
            Logger.info("Mode activated")
            view.markout()
            return true
        }
        
        if key == .escape {
            Logger.info("Mode disabled")
            view.hide()
            return true
        }
        
        return self.decorated.handle(key: &key, modifiers: &modifiers)
    }
}
