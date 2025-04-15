//
//  Config.swift
//  Keyborg
//
//  Created by cat dog on 14.04.2025.
//

let Map: [Key: (Keys: [Key], Modifiers: [Modifier]?)] = [
    // vim like navigation
    Key.h: ([Key.left], nil),
    Key.k: ([Key.up], nil),
    Key.j: ([Key.down], nil),
    Key.l: ([Key.right], nil),
    
    // tab navigation
    Key.s: ([Key.left], [Modifier.option, Modifier.command]),
    Key.d: ([Key.right], [Modifier.option, Modifier.command]),
    
    //
    Key.m: ([Key.enter], nil),
]
