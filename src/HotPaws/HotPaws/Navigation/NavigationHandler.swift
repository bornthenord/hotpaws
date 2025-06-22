//
//  ModeHandler.swift
//  HotPaws
//
//  Created by cat dog on 21.06.2025.
//

import Foundation
import AppKit

class NavigationHandler: KeyHandler {
    let decorated: KeyHandler
    
    init(_ decorated: KeyHandler){
        self.decorated = decorated
    }
    
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> Bool {
        if key == .f {
            Logger.info("Mode activated")
            NavigationWindowController.show()
            return true
        }
        
        return self.decorated.handle(key: &key, modifiers: &modifiers)
    }
}
