//
//  File.swift
//  Keyborg
//
//  Created by cat dog on 16.04.2025.
//

import Foundation

let file = """
    # vim
    h:left
    k:up
    j:down
    l:right
    #
    u:z:command
    y:c:command
    p:v:command
    x:delete
    # tab navigation
    s:left:option,command
    d:right:option,command
    #
    m:enter
    e:escape
    """


struct File {
    public static var content: String = file
}
