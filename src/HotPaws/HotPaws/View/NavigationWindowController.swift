//
//  MarkerView.swift
//  HotPaws
//
//  Created by cat dog on 22.06.2025.
//

import Foundation
import Cocoa

class NavigationWindowController: NSWindowController {
//    private static let shared = NavigationWindowController()
    
    private init() {
        super.init(window: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public static func show() {
//        if NavigationWindowController.shared.window == nil {
//            NavigationWindowController.shared.window = createWindow()
//        }
        
//        let window = NavigationWindowController.shared.window!
        
        if let app = NSRunningApplication.getCurrentApp() {
            let marker = Marker()
            
            for element in app.getClickableElements() {
                if let point = element.getCoordinate() {
                    addLabel(marker.next(), coordinate: point)
                    Logger.info("Add point: \(point)")
                } else {
                    Logger.error("Failed get point")
                }
            }
        } else {
            Logger.error("Failed get app")
        }
        
//        self.makeKeyAndOrderFront(nil)
    }
    
    public static func hide() {
//        NavigationWindowController.shared.window!.close()
    }
    
    private static func createWindow() -> NSWindow {
        // Задаем размеры и позицию окна
        let windowWidth: CGFloat = 400
        let windowHeight: CGFloat = 300
        let windowX: CGFloat = 100 // Положение по оси X
        let windowY: CGFloat = 100 // Положение по оси Y
        
        let window = NSWindow(
            contentRect: NSRect(x: windowX, y: windowY, width: windowWidth, height: windowHeight),
            styleMask: [.titled, .closable, .resizable],
            backing: .buffered,
            defer: false
        )
        
        window.title = "окно"
        
        return window
    }
    
    private static func addLabel(_ text: String, coordinate: CGPoint) {
        let label = NSTextField(frame: NSRect(x: coordinate.x, y: coordinate.y, width: 30, height: 22))
        label.stringValue = text
        label.font = NSFont.systemFont(ofSize: 16)
        label.textColor = NSColor.black
        
//        NavigationWindowController.shared.window!.contentView!.addSubview(label)
    }
}
