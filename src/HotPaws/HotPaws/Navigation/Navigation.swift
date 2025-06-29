//
//  Navigation.swift
//  HotPaws
//
//  Created by cat dog on 26.06.2025.
//

import Foundation
import AppKit

class Navigation: ClickHandler {
    private var elements: Dictionary<String, CGPoint> = [:]
    private let view = NavigationWindow()
    private var isEnabled: Bool = false
    private var firstClick: Click?
    
    init() {
        Keyboard.subscribers["navigation"] = self
    }
    
    func enable() {
        if !self.isEnabled {
            self.markout(handler: view.addLabel)
            self.view.show()
            self.isEnabled = true
            self.firstClick = nil
        }
    }
    
    func disable() {
        self.isEnabled = false
        self.view.hide()
    }
    
    func handle(_ click: Click, modifiers: inout Set<Modifier>) -> HandlerResult {
        if self.isEnabled {
            if click.key == .escape {
                self.disable()
                return .handled
            }
           
            if click.key.isLetter() {
                if self.firstClick == nil {
                    self.firstClick = click
                } else {
                    self.disable()
                    select(first: self.firstClick!, second: click)
                }
            }
        }
        
        return .skip
    }
    
    private func markout(handler: (String, CGPoint) -> Void) {
        if let app = NSRunningApplication.getCurrentApp() {
            let marker = Marker()
            
            for element in app.getClickableElements() {
                if let frame = element.getFrame() {
                    let label = marker.next()
                    
                    elements[label] = frame.origin
                    handler(label, frame.origin)
                }
            }
        }
    }
    
    private func select(first: Click, second: Click) {
        let label = "\(first.key)\(second.key)"
        print(label)
        if let point = elements[label] {
            print("click")
            Mouse.leftClick(at: point)
        }
    }
}
