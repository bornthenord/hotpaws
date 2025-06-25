//
//  NavigationView.swift
//  HotPaws
//
//  Created by cat dog on 23.06.2025.
//

import Foundation
import AppKit

class NavigationWindow {
    private let window: NSWindow
    
    init() {
        window = NavigationWindow.createWindow()
    }
    
    func markout() {
        if let app = NSRunningApplication.getCurrentApp() {
            let marker = Marker()
            
            for element in app.getClickableElements() {
                if let frame = element.getFrame() {
                    window.contentView!.addSubview(createLabel(marker.next(), point: frame.origin))
                }
            }
            
            window.level = .floating
            window.orderFront(nil)
        }
    }
    
    func hide() {
        window.contentView?.subviews.removeAll()
        window.orderOut(nil)
    }
    
    private func createLabel(_ text: String, point: CGPoint) -> NSTextField {
        let label = NSTextField(labelWithString: text)
        label.font = NSFont.boldSystemFont(ofSize: 10)
        label.wantsLayer = true
        label.layer?.backgroundColor = NSColor.yellow.cgColor
//        label.isEditable = true
        label.frame = CGRect(x: point.x, y: point.y, width: 18, height: 12)
        
        return label
    }
    
    private static func createWindow() -> NSWindow {
        let mainFrame = NSScreen.main!.frame
        
        let window = NSWindow(
            contentRect: mainFrame,
            styleMask: [],
            backing: .buffered,
            defer: false
        )
            
        window.isOpaque = false
        window.backgroundColor = NSColor.clear
//        window.backgroundColor = NSColor.windowBackgroundColor.withAlphaComponent(0.8)

        return window
    }
}
