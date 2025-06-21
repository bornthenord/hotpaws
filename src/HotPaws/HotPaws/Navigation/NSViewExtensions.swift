//
//  NSViewExtensions.swift
//  HotPaws
//
//  Created by cat dog on 21.06.2025.
//

import Foundation
import AppKit

extension NSView {
    func getCenterPointOnScreen() -> CGPoint? {
        guard let window = self.window else { return nil }
        let viewFrameInWindow = self.convert(self.bounds, to: nil)
        let screenFrame = window.convertToScreen(viewFrameInWindow)
        let centerX = screenFrame.origin.x + screenFrame.size.width / 2
        let centerY = screenFrame.origin.y + screenFrame.size.height / 2
        return CGPoint(x: centerX, y: centerY)
    }
}
