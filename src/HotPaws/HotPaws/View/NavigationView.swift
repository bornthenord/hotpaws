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
            if let frame = app.getFrame() {
                let view = createView(frame)
                window.contentView!.addSubview(view)
                window.orderFront(nil)
            } else {
                Logger.error("Failled to get current app frame")
            }
        } else {
            Logger.error("Failled to get current app")
        }
    }
    
    func hide() {
        window.contentView?.subviews.removeAll()
        window.orderOut(nil)
    }
    
    private func createView(_ frame: NSRect) -> NSView {
        let view = NSView(frame: frame)

        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.red.cgColor
        
        return view
    }
    
    private static func createWindow() -> NSWindow {
        let mainFrame = NSScreen.main!.frame
        
        let window = NSWindow(
            contentRect: mainFrame,
            //                            styleMask: [.titled, .closable, .resizable],
            styleMask: [],
            backing: .buffered,
            defer: false
        )
            
        window.isOpaque = false
        window.backgroundColor = NSColor.windowBackgroundColor.withAlphaComponent(0.8)
        
        return window
    }
}
