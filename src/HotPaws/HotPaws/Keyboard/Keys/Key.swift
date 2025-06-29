//
//  Key.swift
//  HotPaws
//
//  Created by cat dog on 14.04.2025.
//
enum KeyErrors: Error {
    case KeyNotExists(_ key: String)
}

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
    
    init?(from key: String) {
        switch key {
        case "return":
            self = .return
        case "enter":
            self = .enter
        case "tab":
            self = .tab
        case "space":
            self = .space
        case "delete":
            self = .delete
        case "forwardDelete":
            self = .forwardDelete
        case "escape":
            self = .escape
        case "left":
            self = .left
        case "right":
            self = .right
        case "down":
            self = .down
        case "up":
            self = .up
        case "volumeUp":
            self = .volumeUp
        case "volumeDown":
            self = .volumeDown
        case "mute":
            self = .mute
        case "help":
            self = .help
        case "home":
            self = .home
        case "pageUp":
            self = .pageUp
        case "end":
            self = .end
        case "pageDown":
            self = .pageDown
            
        case "f1":
            self = .f1
        case "f2":
            self = .f2
        case "f3":
            self = .f3
        case "f4":
            self = .f4
        case "f5":
            self = .f5
        case "f6":
            self = .f6
        case "f7":
            self = .f7
        case "f8":
            self = .f8
        case "f9":
            self = .f9
        case "f10":
            self = .f10
        case "f11":
            self = .f11
        case "f12":
            self = .f12
        case "f13":
            self = .f13
        case "f14":
            self = .f14
        case "f15":
            self = .f15
        case "f16":
            self = .f16
        case "f17":
            self = .f17
        case "f18":
            self = .f18
        case "f19":
            self = .f19
        case "f20":
            self = .f20
            
        case "a":
            self = .a
        case "b":
            self = .b
        case "c":
            self = .c
        case "d":
            self = .d
        case "e":
            self = .e
        case "f":
            self = .f
        case "g":
            self = .g
        case "h":
            self = .h
        case "i":
            self = .i
        case "j":
            self = .j
        case "k":
            self = .k
        case "l":
            self = .l
        case "m":
            self = .m
        case "n":
            self = .n
        case "o":
            self = .o
        case "p":
            self = .p
        case "q":
            self = .q
        case "r":
            self = .r
        case "s":
            self = .s
        case "t":
            self = .t
        case "u":
            self = .u
        case "v":
            self = .v
        case "w":
            self = .w
        case "x":
            self = .x
        case "y":
            self = .y
        case "z":
            self = .z
            
        case "zero":
            self = .zero
        case "one":
            self = .one
        case "two":
            self = .two
        case "three":
            self = .three
        case "four":
            self = .four
        case "five":
            self = .five
        case "six":
            self = .six
        case "seven":
            self = .seven
        case "eight":
            self = .eight
        case "nine":
            self = .nine
            
        case "equals":
            self = .equals
        case "minus":
            self = .minus
        case "semicolon":
            self = .semicolon
        case "apostrophe":
            self = .apostrophe
        case "comma":
            self = .comma
        case "period":
            self = .period
        case "slash":
            self = .slash
        case "backslash":
            self = .backslash
        case "grave":
            self = .grave
        case "leftBracket":
            self = .leftBracket
        case "rightBracket":
            self = .rightBracket
            
        case "keypadDecimal":
            self = .keypadDecimal
        case "keypadMultiply":
            self = .keypadMultiply
        case "keypadPlus":
            self = .keypadPlus
        case "keypadClear":
            self = .keypadClear
        case "keypadDivide":
            self = .keypadDivide
        case "keypadMinus":
            self = .keypadMinus
        case "keypadEquals":
            self = .keypadEquals
            
        case "keypad0":
            self = .keypad0
        case "keypad1":
            self = .keypad1
        case "keypad2":
            self = .keypad2
        case "keypad3":
            self = .keypad3
        case "keypad4":
            self = .keypad4
        case "keypad5":
            self = .keypad5
        case "keypad6":
            self = .keypad6
        case "keypad7":
            self = .keypad7
        case "keypad8":
            self = .keypad8
        case "keypad9":
            self = .keypad9
            
        default:
            return nil
        }
    }
}
