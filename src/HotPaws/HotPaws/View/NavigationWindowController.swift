//
//  MarkerView.swift
//  HotPaws
//
//  Created by cat dog on 22.06.2025.
//

import Foundation
import Cocoa

class NavigationWindowController: NSWindowController {
    private static let shared = NavigationWindowController()
    
    private init() {
        super.init(window: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public static func show() {
        if NavigationWindowController.shared.window == nil {
            NavigationWindowController.shared.window = createWindow()
        }
        
        let window = NavigationWindowController.shared.window
        
        window?.center()
        window?.toggleFullScreen(self)
        window?.makeKeyAndOrderFront(nil)
    }
    
    func hide() {
        NavigationWindowController.shared.window?.close()
    }
    
    private static func createWindow() -> NSWindow {
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 800, height: 600),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered, defer: false
        )
        
        window.collectionBehavior = .fullScreenPrimary
        window.title = "Полноэкранное окно"
        window.isMovableByWindowBackground = true
        
        window.contentViewController = NavigationViewController()
        
        return window
    }
}

// Контроллер содержимого окна
class NavigationViewController: NSViewController {
    
    override func loadView() {
        view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.white.cgColor
    }
}
