//
//  ModifierFlagsExtensions.swift
//  HotPaws
//
//  Created by cat dog on 08.06.2025.
//

import Foundation
import AppKit

extension NSEvent.ModifierFlags {
    public func containsRightCommand() -> Bool{
        return self.contains(.command) && self.rawValue == 1048848
    }
    
    public func containsRightOption() -> Bool{
        return self.contains(.option) && self.rawValue == 524608
    }
    
    public func containsRightShift() -> Bool{
        return self.contains(.shift) && self.rawValue == 131332
    }
}
