//
//  Config.swift
//  Keyborg
//
//  Created by cat dog on 14.04.2025.
//

let Config: [Key: (Keys: [Key], Modifiers: [Modifier]?)] = [
    // vim
    Key.h: ([Key.left], nil),
    Key.k: ([Key.up], nil),
    Key.j: ([Key.down], nil),
    Key.l: ([Key.right], nil),
    
    Key.u: ([Key.z], [Modifier.command]),
    Key.y: ([Key.c], [Modifier.command]),
    Key.p: ([Key.v], [Modifier.command]),
    Key.x: ([Key.delete], nil),

    // tab navigation
    Key.s: ([Key.left], [Modifier.option, Modifier.command]),
    Key.d: ([Key.right], [Modifier.option, Modifier.command]),
    
    //
    Key.m: ([Key.enter], nil),
    Key.e: ([Key.escape], nil),
]
