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
                    window.contentView!.addSubview(createLabel(marker.next(), frame: frame))
                } else {
                    Logger.error("Failled to get element frame")
                }
            }
            
            window.level = .floating
            window.orderFront(nil)
        } else {
            Logger.error("Failled to get current app")
        }
    }
    
    func hide() {
        window.contentView?.subviews.removeAll()
        window.orderOut(nil)
    }
    
    private func createLabel(_ text: String, frame: CGRect) -> NSTextField {
        let label = NSTextField(labelWithString: text)
        label.frame = frame
        return label
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
