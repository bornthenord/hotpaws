//
//  KeyExtensions.swift
//  HotPaws
//
//  Created by cat dog on 15.06.2025.
//

import Foundation

extension Button {
    public func isModifierButton() -> Bool {
        return self == .capslock ||
        self == .shift ||
        self == .shiftr ||
        self == .fn ||
        self == .ctrl ||
        self == .opt ||
        self == .optr ||
        self == .cmd ||
        self == .cmdr
    }
    
    public func isMouseButton() -> Bool {
        return self == .mouseUp ||
        self == .mouseDown ||
        self == .mouseLeft ||
        self == .mouseRight
    }
}
