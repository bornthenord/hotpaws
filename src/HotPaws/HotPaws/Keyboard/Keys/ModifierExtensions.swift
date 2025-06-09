//
//  ModifierExtensions.swift
//  HotPaws
//
//  Created by cat dog on 09.06.2025.
//

import Foundation

extension [Modifier]?{
   public func merge(_ other: [Modifier]?) -> [Modifier]? {
       if self == nil {
           return other
       }
       
       if other == nil {
           return self
       }
       
       return self! + other!
    }
}
