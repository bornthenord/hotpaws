//
//  Key.swift
//  keyborg
//
//  Created by cat dog on 14.04.2025.
//

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
    case command                    = 0x37
    case shift                      = 0x38
    case capsLock                   = 0x39
    case option                     = 0x3A
    case control                    = 0x3B
    case rightShift                 = 0x3C
    case rightOption                = 0x3D
    case rightControl               = 0x3E
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
    case f9                         = 0x65
    case f10                        = 0x6D
    case f11                        = 0x67
    case f12                        = 0x6F
    case f13                        = 0x69
    case f14                        = 0x6B
    case f15                        = 0x71
    case f16                        = 0x6A
    case f17                        = 0x40
    case f18                        = 0x4F
    case f19                        = 0x50
    case f20                        = 0x5A
}

enum Modifier: UInt16 {
    case shift                      = 0x38
    case control                    = 0x3B
    case option                     = 0x3A
    case command                    = 0x37
}
