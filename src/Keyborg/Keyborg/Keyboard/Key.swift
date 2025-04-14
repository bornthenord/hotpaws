//
//  Key.swift
//  keyborg-app
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
}

enum Modifier: UInt16 {
    case shift                      = 0x38
    case control                    = 0x3B
    case option                     = 0x3A
    case command                    = 0x37
}
