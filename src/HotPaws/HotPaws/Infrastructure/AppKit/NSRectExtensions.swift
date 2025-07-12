//
//  NSRectExtensions.swift
//  HotPaws
//
//  Created by cat dog on 13.07.2025.
//

import Foundation

extension NSRect {
    func getCenter() -> CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}
