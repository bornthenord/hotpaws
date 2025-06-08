//
//  Modifier.swift
//  HotPaws
//
//  Created by cat dog on 08.05.2025.
//

enum Modifier: UInt16, CaseIterable {
    case shift                     = 0x38
    case control                   = 0x3B
    case option                    = 0x3A
    case command                   = 0x37
    case function                  = 0x3F
    case capsLock                  = 0x39
    case rightShift                = 0x3C
    case rightControl              = 0x3E
    case rightOption               = 0x3D
    case rightCommand              = 0x36
    
    var description : String {
        switch self {
        case .shift: return "shift"
        case .control: return "control"
        case .option: return "option"
        case .command: return "command"
        case .function: return "function"
        case .capsLock: return "capsLock"
            
        case .rightShift: return "rightShift"
        case .rightControl: return "rightControl"
        case .rightOption: return "rightOption"
        case .rightCommand: return "rightCommand"
        }
    }
    
    public static func parse(_ modifier: String) throws -> Modifier {
        switch modifier {
        case "shift":
            return .shift
        case "control":
            return .control
        case "option":
            return .option
        case "command":
            return .command
        case "function":
            return .function
        case "capsLock":
            return .capsLock
        case "rightShift":
            return .rightShift
        case "rightControl":
            return .rightControl
        case "rightOption":
            return .rightOption
        case "rightCommand":
            return .rightCommand
            
        default:
            throw KeyErrors.KeyNotExists(key: modifier)
        }
    }
    
    public static func GetAll() -> [Modifier] {
        var result = [Modifier]()
        
        for modifier in Modifier.allCases {
            result.append(modifier)
        }
        
        return result
    }
}
