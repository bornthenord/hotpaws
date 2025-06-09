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
    
    var description : String {
        switch self {
        case .shift: return "shift"
        case .shiftr: return "shiftr"
        case .ctrl: return "ctrl"
        case .opt: return "opt"
        case .optr: return "optr"
        case .cmd: return "cmd"
        case .cmdr: return "cmdr"
        case .fn: return "fn"
        case .capslock: return "capslock"
        }
    }
    
    public static func parse(_ modifier: String) throws -> Modifier {
        switch modifier {
        case "shift":
            return .shift
        case "shiftr":
            return .shiftr
        case "ctrl":
            return .ctrl
        case "opt":
            return .opt
        case "optr":
            return .optr
        case "cmd":
            return .cmd
        case "cmdr":
            return .cmdr
        case "fn":
            return .fn
        case "capslock":
            return .capslock
        default:
            throw KeyErrors.KeyNotExists(key: modifier)
        }
    }
}
