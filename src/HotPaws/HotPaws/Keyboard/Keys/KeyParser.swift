//
//  Parser.swift
//  HotPaws
//
//  Created by cat dog on 08.05.2025.
//

import Foundation

enum KeyErrors: Error {
    case KeyNotExists(key: String)
}

class KeyParser {
    
    static func parseKey(_ key: String) throws -> Key {
        let lower = key.lowercased()
        
        switch lower {
            
        case "return":
            return .return
        case "enter":
            return .enter
        case "tab":
            return .tab
        case "space":
            return .space
        case "delete":
            return .delete
        case "escape":
            return .escape
        case "left":
            return .left
        case "right":
            return .right
        case "down":
            return .down
        case "up":
            return .up
        case "volumeUp":
            return .volumeUp
        case "volumeDown":
            return .volumeDown
        case "mute":
            return .mute
        case "help":
            return .help
        case "home":
            return .home
        case "pageUp":
            return .pageUp
        case "end":
            return .end
        case "pageDown":
            return .pageDown
        case "function":
            return .function
        
        case "f1":
            return .f1
        case "f2":
            return .f2
        case "f3":
            return .f3
        case "f4":
            return .f4
        case "f5":
            return .f5
        case "f6":
            return .f6
        case "f7":
            return .f7
        case "f8":
            return .f8
        case "f9":
            return .f9
        case "f10":
            return .f10
        case "f11":
            return .f11
        case "f12":
            return .f12
        case "f13":
            return .f13
        case "f14":
            return .f14
        case "f15":
            return .f15
        case "f16":
            return .f16
        case "f17":
            return .f17
        case "f18":
            return .f18
        case "f19":
            return .f19
        case "f20":
            return .f20
        
        case "a":
            return .a
        case "b":
            return .b
        case "c":
            return .c
        case "d":
            return .d
        case "e":
            return .e
        case "f":
            return .f
        case "g":
            return .g
        case "h":
            return .h
        case "i":
            return .i
        case "j":
            return .j
        case "k":
            return .k
        case "l":
            return .l
        case "m":
            return .m
        case "n":
            return .n
        case "o":
            return .o
        case "p":
            return .p
        case "q":
            return .q
        case "r":
            return .r
        case "s":
            return .s
        case "t":
            return .t
        case "u":
            return .u
        case "v":
            return .v
        case "w":
            return .w
        case "x":
            return .x
        case "y":
            return .y
        case "z":
            return .z
            
        case "zero":
            return .zero
        case "one":
            return .one
        case "two":
            return .two
        case "three":
            return .three
        case "four":
            return .four
        case "five":
            return .five
        case "six":
            return .six
        case "seven":
            return .seven
        case "eight":
            return .eight
        case "nine":
            return .nine
            
        case "equals":
            return .equals
        case "minus":
            return .minus
        case "semicolon":
            return .semicolon
        case "apostrophe":
            return .apostrophe
        case "comma":
            return .comma
        case "period":
            return .period
        case "slash":
            return .slash
        case "backslash":
            return .backslash
        case "grave":
            return .grave
        case "leftBracket":
            return .leftBracket
        case "rightBracket":
            return .rightBracket
        
        case "keypadDecimal":
            return .keypadDecimal
        case "keypadMultiply":
            return .keypadMultiply
        case "keypadPlus":
            return .keypadPlus
        case "keypadClear":
            return .keypadClear
        case "keypadDivide":
            return .keypadDivide
        case "keypadMinus":
            return .keypadMinus
        case "keypadEquals":
            return .keypadEquals
        
        case "keypad0":
            return .keypad0
        case "keypad1":
            return .keypad1
        case "keypad2":
            return .keypad2
        case "keypad3":
            return .keypad3
        case "keypad4":
            return .keypad4
        case "keypad5":
            return .keypad5
        case "keypad6":
            return .keypad6
        case "keypad7":
            return .keypad7
        case "keypad8":
            return .keypad8
        case "keypad9":
            return .keypad9
    
        default:
            throw KeyErrors.KeyNotExists(key: key)
        }
    }
    
    public static func parseModifier(_ modifier: String) throws -> Modifier {
        let lower = modifier.lowercased()
        
        switch lower {
        case "shift":
            return .shift
        case "control":
            return .control
        case "option":
            return .option
        case "command":
            return .command

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
}
