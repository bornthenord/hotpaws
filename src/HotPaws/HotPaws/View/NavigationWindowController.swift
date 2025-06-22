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
        
        let window = NavigationWindowController.shared.window!
        
        let view = NavigationViewController()
        
        if let app = NSRunningApplication.getCurrentApp() {
            let marker = Marker()
            
            for element in app.getClickableElements() {
                if let point = element.getPoint() {
                    view.addLabel(marker.next(), point: point)
                    Logger.info("Add point: \(point)")
                } else {
                    Logger.error("Failed get point")
                }
            }
        } else {
            Logger.error("Failed get app")
        }
        
        window.contentViewController = view
        
        window.center()
        window.toggleFullScreen(self)
        window.makeKeyAndOrderFront(nil)
    }
    
    public static func hide() {
        NavigationWindowController.shared.window!.close()
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
    
    func addLabel(_ text: String, point: CGPoint) {
        let label = NSTextField(labelWithString: text)
        
        label.frame = NSRect(x: point.x, y: point.y, width: 30, height: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label)
    }
}
