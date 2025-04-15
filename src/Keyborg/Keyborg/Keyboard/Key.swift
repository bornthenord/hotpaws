//
//  Key.swift
//  keyborg
//
//  Created by cat dog on 14.04.2025.
//

enum KeyErrors: Error {
    case KeyNotExists
}

enum Key: UInt16 {
    case a                          = 0x00
    case b                          = 0x0B
    case c                          = 0x08
    case d                          = 0x02
    case e                          = 0x0E
    case f                          = 0x03
    case g                          = 0x05
    case h                          = 0x04
    case i                          = 0x22
    case j                          = 0x26
    case k                          = 0x28
    case l                          = 0x25
    case m                          = 0x2E
    case n                          = 0x2D
    case o                          = 0x1F
    case p                          = 0x23
    case q                          = 0x0C
    case r                          = 0x0F
    case s                          = 0x01
    case t                          = 0x11
    case u                          = 0x20
    case v                          = 0x09
    case w                          = 0x0D
    case x                          = 0x07
    case y                          = 0x10
    case z                          = 0x06
    case left                       = 0x7B
    case right                      = 0x7C
    case down                       = 0x7D
    case up                         = 0x7E
    case enter                      = 0x24
    case tab                        = 0x30
    case space                      = 0x31
    case delete                     = 0x33
    case escape                     = 0x35
    case volumeUp                   = 0x48
    case volumeDown                 = 0x49
    case mute                       = 0x4A
    case help                       = 0x72
    case home                       = 0x73
    case pageUp                     = 0x74
    case forwardDelete              = 0x75
    case end                        = 0x77
    case pageDown                   = 0x79
    case function                   = 0x3F
    case f1                         = 0x7A
    case f2                         = 0x78
    case f4                         = 0x76
    case f5                         = 0x60
    case f6                         = 0x61
    case f7                         = 0x62
    case f3                         = 0x63
    case f8                         = 0x64
    
    public static func parse(_ key: String) throws -> Key {
        let lower = key.lowercased()
        
        switch lower {
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
        case "left":
            return .left
        case "right":
            return .right
        case "down":
            return .down
        case "up":
            return .up
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
        case "pageDown":
            return .pageDown
        case "forwardDelete":
            return .forwardDelete
        case "end":
            return .end
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
        default:
            throw KeyErrors.KeyNotExists
        }
    }
}

enum Modifier: UInt16 {
    case shift                      = 0x38
    case control                    = 0x3B
    case option                     = 0x3A
    case command                    = 0x37
    
    public static func parse(_ modifier: String) throws -> Modifier {
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
        default:
            throw KeyErrors.KeyNotExists
        }
    }
}
