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
        
        if let app = NSRunningApplication.getCurrentApp() {
            let marker = Marker()
            
            for element in app.getClickableElements() {
                let point = element.getPoint()
                
                window?.contentView?.subviews.append(createLabel(withText: marker.next(), coordinate: point!))
                
                Logger.info(point!)
            }
        }
        
        window?.center()
        window?.makeKeyAndOrderFront(nil)
    }
    
    func hide() {
        NavigationWindowController.shared.window?.close()
    }
    
    private static func createLabel(withText text: String, coordinate: CGPoint) -> NSTextField {
        let label = NSTextField(frame: NSRect(x: coordinate.x, y: coordinate.y, width: 30, height: 22))
        label.stringValue = text
        label.font = NSFont.systemFont(ofSize: 16)
        label.textColor = NSColor.black
//        label.isBezeled = false // Убираем рамку
//        label.backgroundColor = NSColor.clear
        
        return label
    }
    
    private static func createWindow() -> NSWindow {
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 400, height: 300), // Установка фиксированного размера
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered, defer: false
        )
        
        window.title = "Прозрачное окно"
        window.isMovableByWindowBackground = true
        
        // Настройка прозрачности
        window.backgroundColor = NSColor.clear
//        window.opaque = false // Указываем, что окно не должно быть непрозрачным
        
        return window
    }
}

// Контроллер содержимого окна
class NavigationViewController: NSViewController {
    
    override func loadView() {
        view = NSView()
//        view.wantsLayer = true
//        view.layer?.backgroundColor = NSColor.clear.cgColor
    }
}
