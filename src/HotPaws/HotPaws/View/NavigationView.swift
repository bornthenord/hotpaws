//
//  NavigationView.swift
//  HotPaws
//
//  Created by cat dog on 23.06.2025.
//

import Foundation
import AppKit

class NavigationView {
    private let window: NSWindow
    
    init(_ frame: NSRect) {
        window = NSWindow(
            contentRect: frame,
//                            styleMask: [.titled, .closable, .resizable],
            styleMask: [],
            backing: .buffered,
            defer: false
        )
        
        window.title = "окно"
        
//        let label = NSTextField(frame: NSRect(x: 0, y: 0, width: 30, height: 22))
//        label.stringValue = "AA"
//        label.font = NSFont.systemFont(ofSize: 16)
//        label.textColor = NSColor.black
//        
//        window.contentView!.addSubview(label)
    }
    
    func show() {
        window.makeKeyAndOrderFront(nil)
    }
}
