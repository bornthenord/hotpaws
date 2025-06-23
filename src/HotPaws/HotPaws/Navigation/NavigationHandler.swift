//
//  ModeHandler.swift
//  HotPaws
//
//  Created by cat dog on 21.06.2025.
//

import Foundation
import AppKit

class NavigationHandler: KeyHandler {
    let decorated: KeyHandler
    
    init(_ decorated: KeyHandler){
        self.decorated = decorated
    }
    
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> Bool {
        if key == .f {
            Logger.info("Mode activated")
            
            if let app = NSRunningApplication.getCurrentApp() {
                
                if let appSize = app.getSize() {
                    if let appPosition = app.getCoordinate() {
                        // Задаем размеры и позицию окна
                        let windowWidth: CGFloat = appSize.width
                        let windowHeight: CGFloat = appSize.height
                        
                        let windowX: CGFloat = appPosition.x
                        let windowY: CGFloat = appPosition.y
                        
                        let window = NSWindow(
                            contentRect: NSRect(x: windowX, y: windowY, width: windowWidth, height: windowHeight),
//                            styleMask: [.titled, .closable, .resizable],
                            styleMask: [],
                            backing: .buffered,
                            defer: false
                        )
                        
                        window.title = "окно"
                        
                        let label = NSTextField(frame: NSRect(x: 0, y: 0, width: 30, height: 22))
                        label.stringValue = "AA"
                        label.font = NSFont.systemFont(ofSize: 16)
                        label.textColor = NSColor.black
                        
                        window.contentView!.addSubview(label)
                        
                        window.makeKeyAndOrderFront(nil)
                        return true
                    } else {
                        Logger.error("Can't get app coordinate")
                    }
                } else {
                    Logger.error("Can't get app size")
                }
            }
        }
        
        if key == .escape {
            Logger.info("Mode disabled")
            NavigationWindowController.hide()
            return true
        }
        
        return self.decorated.handle(key: &key, modifiers: &modifiers)
    }
}
