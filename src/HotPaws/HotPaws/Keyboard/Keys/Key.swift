//
//  Key.swift
//  HotPaws
//
//  Created by cat dog on 14.04.2025.
//

enum Key: UInt16 {
    case `return`                  = 0x24
    case enter                     = 0x4C
    case tab                       = 0x30
    case space                     = 0x31
    case delete                    = 0x33
    case forwardDelete             = 0x75
    case escape                    = 0x35
    case left                      = 0x7B
    case right                     = 0x7C
    case down                      = 0x7D
    case up                        = 0x7E
    case volumeUp                  = 0x48
    case volumeDown                = 0x49
    case mute                      = 0x4A
    case help                      = 0x72
    case home                      = 0x73
    case pageUp                    = 0x74
    case end                       = 0x77
    case pageDown                  = 0x79
    
    case f1                        = 0x7A
    case f2                        = 0x78
    case f4                        = 0x76
    case f5                        = 0x60
    case f6                        = 0x61
    case f7                        = 0x62
    case f3                        = 0x63
    case f8                        = 0x64
    case f9                        = 0x65
    case f10                       = 0x6D
    case f11                       = 0x67
    case f12                       = 0x6F
    case f13                       = 0x69
    case f14                       = 0x6B
    case f15                       = 0x71
    case f16                       = 0x6A
    case f17                       = 0x40
    case f18                       = 0x4F
    case f19                       = 0x50
    case f20                       = 0x5A
    
    case a                         = 0x00
    case b                         = 0x0B
    case c                         = 0x08
    case d                         = 0x02
    case e                         = 0x0E
    case f                         = 0x03
    case g                         = 0x05
    case h                         = 0x04
    case i                         = 0x22
    case j                         = 0x26
    case k                         = 0x28
    case l                         = 0x25
    case m                         = 0x2E
    case n                         = 0x2D
    case o                         = 0x1F
    case p                         = 0x23
    case q                         = 0x0C
    case r                         = 0x0F
    case s                         = 0x01
    case t                         = 0x11
    case u                         = 0x20
    case v                         = 0x09
    case w                         = 0x0D
    case x                         = 0x07
    case y                         = 0x10
    case z                         = 0x06
    
    case zero                      = 0x1D
    case one                       = 0x12
    case two                       = 0x13
    case three                     = 0x14
    case four                      = 0x15
    case five                      = 0x17
    case six                       = 0x16
    case seven                     = 0x1A
    case eight                     = 0x1C
    case nine                      = 0x19
    
    case equals                    = 0x18
    case minus                     = 0x1B
    case semicolon                 = 0x29
    case apostrophe                = 0x27
    case comma                     = 0x2B
    case period                    = 0x2F
    case slash                     = 0x2C
    case backslash                 = 0x2A
    case grave                     = 0x32
    case leftBracket               = 0x21
    case rightBracket              = 0x1E
    
    case keypadDecimal             = 0x41
    case keypadMultiply            = 0x43
    case keypadPlus                = 0x45
    case keypadClear               = 0x47
    case keypadDivide              = 0x4B
    case keypadMinus               = 0x4E
    case keypadEquals              = 0x51
    case keypad0                   = 0x52
    case keypad1                   = 0x53
    case keypad2                   = 0x54
    case keypad3                   = 0x55
    case keypad4                   = 0x56
    case keypad5                   = 0x57
    case keypad6                   = 0x58
    case keypad7                   = 0x59
    case keypad8                   = 0x5B
    case keypad9                   = 0x5C
    
    var description : String {
        switch self {
        case .return: return "return"
        case .enter: return "enter"
        case .tab: return "tab"
        case .space: return "space"
        case .delete: return "delete"
        case .forwardDelete: return "forwardDelete"
        case .escape: return "escape"
        case .left: return "left"
        case .right: return "right"
        case .down: return "down"
        case .up: return "up"
        case .volumeUp: return "volumeUp"
        case .volumeDown: return "volumeDown"
        case .mute: return "mute"
        case .help: return "help"
        case .home: return "home"
        case .pageUp: return "pageUp"
        case .end: return "end"
        case .pageDown: return "pageDown"
            
        case .f1: return "f1"
        case .f2: return "f2"
        case .f3: return "f3"
        case .f4: return "f4"
        case .f5: return "f5"
        case .f6: return "f6"
        case .f7: return "f7"
        case .f8: return "f8"
        case .f9: return "f9"
        case .f10: return "f10"
        case .f11: return "f11"
        case .f12: return "f12"
        case .f13: return "f13"
        case .f14: return "f14"
        case .f15: return "f15"
        case .f16: return "f16"
        case .f17: return "f17"
        case .f18: return "f18"
        case .f19: return "f19"
        case .f20: return "f20"
            
        case .a: return "a"
        case .b: return "b"
        case .c: return "c"
        case .d: return "d"
        case .e: return "e"
        case .f: return "f"
        case .g: return "g"
        case .h: return "h"
        case .i: return "i"
        case .j: return "j"
        case .k: return "k"
        case .l: return "l"
        case .m: return "m"
        case .n: return "n"
        case .o: return "o"
        case .p: return "p"
        case .q: return "q"
        case .r: return "r"
        case .s: return "s"
        case .t: return "t"
        case .u: return "u"
        case .v: return "v"
        case .w: return "w"
        case .x: return "x"
        case .y: return "y"
        case .z: return "z"
            
        case .zero: return "zero"
        case .one: return "one"
        case .two: return "two"
        case .three: return "three"
        case .four: return "four"
        case .five: return "five"
        case .six: return "six"
        case .seven: return "seven"
        case .eight: return "eight"
        case .nine: return "nine"
            
        case .equals: return "equals"
        case .minus: return "minus"
        case .semicolon: return "semicolon"
        case .apostrophe: return "apostrophe"
        case .comma: return "comma"
        case .period: return "period"
        case .slash: return "slash"
        case .backslash: return "backslash"
        case .grave: return "grave"
        case .leftBracket: return "leftBracket"
        case .rightBracket: return "rightBracket"
            
        case .keypadDecimal: return "keypadDecimal"
        case .keypadMultiply: return "keypadMultiply"
        case .keypadPlus: return "keypadPlus"
        case .keypadClear: return "keypadClear"
        case .keypadDivide: return "keypadDivide"
        case .keypadMinus: return "keypadMinus"
        case .keypadEquals: return "keypadEquals"
        case .keypad0: return "keypad0"
        case .keypad1: return "keypad1"
        case .keypad2: return "keypad2"
        case .keypad3: return "keypad3"
        case .keypad4: return "keypad4"
        case .keypad5: return "keypad5"
        case .keypad6: return "keypad6"
        case .keypad7: return "keypad7"
        case .keypad8: return "keypad8"
        case .keypad9: return "keypad9"
        }
    }
}
