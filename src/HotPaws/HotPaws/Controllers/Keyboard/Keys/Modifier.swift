//
//  Modifier.swift
//  HotPaws
//
//  Created by cat dog on 08.05.2025.
//

public enum Modifier: UInt16, CaseIterable {
    case shift                     = 0x38
    case shiftr                    = 0x3C
    case ctrl                      = 0x3B
    case opt                       = 0x3A
    case optr                      = 0x3D
    case cmd                       = 0x37
    case cmdr                      = 0x36
    case fn                        = 0x3F
    case capslock                  = 0x39
    case general                   = 0x00
    
    init?(from raw: String) {
        let modifier = raw.lowercased()
        
        switch modifier {
        case "shift":
            self = .shift
        case "shiftr":
            self = .shiftr
        case "ctrl":
            self = .ctrl
        case "opt":
            self = .opt
        case "optr":
            self = .optr
        case "cmd":
            self = .cmd
        case "cmdr":
            self = .cmdr
        case "fn":
            self = .fn
        case "capslock":
            self = .capslock
        case "general":
            self = .general
        default:
            return nil
        }
    }
}
