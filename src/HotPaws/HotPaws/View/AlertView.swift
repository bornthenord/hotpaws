//
//  AlertView.swift
//  HotPaws
//
//  Created by cat dog on 09.06.2025.
//

import Foundation
import AppKit

class AlertView {
    public static func alert(window: NSWindow, text: String) {
        let alert = NSAlert()
        alert.messageText = text
        alert.beginSheetModal(for: window)
    }
}
