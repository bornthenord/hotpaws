//
//  ModifierExtensions.swift
//  HotPaws
//
//  Created by cat dog on 13.07.2025.
//

import Foundation

extension Set<Modifier> {
    func containsCmd() -> Bool {
        return contains(.cmd) || contains(.cmdr)
    }
    
    func containsShift() -> Bool {
        return contains(.shift) || contains(.shiftr)
    }
    
    func containsOpt() -> Bool {
        return contains(.opt) || contains(.optr)
    }
}
