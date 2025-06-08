//
//  Default.swift
//  HotPaws
//
//  Created by cat dog on 16.04.2025.
//
internal var DefaultControlKey: Modifier {
    get {
        return .function
    }
}

public let DefaultConfig: String = """
    # navigation
    h:left
    k:up
    j:down
    l:right
    # cmd z,c,v, del
    u:z:command
    y:c:command
    p:v:command
    x:delete
    # go to begin/end
    e:right:option
    b:left:option
    # tab navigation
    s:left:option,command
    d:right:option,command
    """
