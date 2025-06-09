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
    
    public func getPressedModifiers() -> Set<Modifier>
    {
        var result = Set<Modifier>(minimumCapacity: 4)
        
        if self.contains(.capsLock) {
            result.insert(.capsLock)
        }
        
        if self.contains(.function) {
            result.insert(.function)
        }
        
        if self.contains(.control){
            result.insert(.control)
        }
        
        if self.contains(.option) && self.rawValue != OptionRightValue {
            result.insert(.option)
        }
        
        if self.rawValue == OptionRightValue {
            result.insert(.rightOption)
        }
        
        if self.contains(.command) && self.rawValue != CommandRightValue {
            result.insert(.command)
        }
        
        if self.rawValue == CommandRightValue {
            result.insert(.rightCommand)
        }
        
        if self.contains(.shift) && self.rawValue != ShiftRightValue {
            result.insert(.shift)
        }
        
        if self.rawValue == ShiftRightValue {
            result.insert(.rightShift)
        }
        
        return result
    }
}
