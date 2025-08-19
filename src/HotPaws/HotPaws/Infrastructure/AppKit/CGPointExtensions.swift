//
//  CGPointExtensions.swift
//  HotPaws
//
//  Created by cat dog on 13.07.2025.
//

import Foundation
import AppKit

extension CGPoint {
    func toRelativeScreen() -> CGPoint {
        let screenHeight = NSScreen.main?.frame.height ?? 0
        let correctedY = screenHeight - y

        return CGPoint(x: x, y: correctedY)
    }
}
