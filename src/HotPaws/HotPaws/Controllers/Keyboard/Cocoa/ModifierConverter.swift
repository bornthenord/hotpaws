//
//  ModifierFlagsExtensions.swift
//  HotPaws
//
//  Created by cat dog on 08.06.2025.
//

import Foundation
import AppKit

private let CommandRightValue: Int = 1048848
private let OptionRightValue: Int = 524608
private let ShiftRightValue: Int = 131332

extension NSEvent.ModifierFlags {
    
    public func toModifiers() -> Set<Modifier>
    {
        var result = Set<Modifier>(minimumCapacity: 5)
        
        if self.contains(.capsLock) {
            result.insert(.capslock)
        }
        
        if self.contains(.function) {
            result.insert(.fn)
        }
        
        if self.contains(.control){
            result.insert(.ctrl)
        }
        
        if self.contains(.option) && self.rawValue != OptionRightValue {
            result.insert(.opt)
        }
        
        if self.rawValue == OptionRightValue {
            result.insert(.optr)
        }
        
        if self.contains(.command) && self.rawValue != CommandRightValue {
            result.insert(.cmd)
        }
        
        if self.rawValue == CommandRightValue {
            result.insert(.cmdr)
        }
        
        if self.contains(.shift) && self.rawValue != ShiftRightValue {
            result.insert(.shift)
        }
        
        if self.rawValue == ShiftRightValue {
            result.insert(.shiftr)
        }
        
        return result
    }
}

extension Set<Modifier> {
    public func toFlags() -> CGEventFlags {
        var flags: CGEventFlags = []
        
        for modifier in self {
            switch modifier {
            case .shift:
                flags.insert(.maskShift)
            case .shiftr:
                flags.insert(.maskShift)
            case .ctrl:
                flags.insert(.maskControl)
            case .opt:
                flags.insert(.maskAlternate)
            case .optr:
                flags.insert(.maskAlternate)
            case .cmd:
                flags.insert(.maskCommand)
            case .cmdr:
                flags.insert(.maskCommand)
            case .fn:
                continue
            case .capslock:
                continue
            case .general:
               continue
            }
        }
        
        return flags
    }
}
