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
                    let label = "\(self.firstClick!.key)\(click.key)"
                    let withShift = modifiers.containsShift()
                    
                    self.disable()
                    select(label: label, withShift: withShift)
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
                    let point = frame.getCenter()
    
                    elements[label] = point
                    handler(label, point)
                }
            }
        }
    }
    
    private func select(label: String, withShift: Bool = false) {
        if let point = elements[label] {
            let pointRealtiveScreen = point.toRelativeScreen()
            
            if withShift {
                Mouse.rightClick(at: pointRealtiveScreen)
            } else {
                Mouse.leftClick(at: pointRealtiveScreen)
            }
        }
    }
}
