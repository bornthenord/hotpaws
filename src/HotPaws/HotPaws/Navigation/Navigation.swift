//
//  Navigation.swift
//  HotPaws
//
//  Created by cat dog on 26.06.2025.
//

import Foundation
import AppKit

class Navigation {
    private var elements: Dictionary<String, CGPoint> = [:]
    
    func markout(handler: (String, CGPoint) -> Void) {
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
    
    func select(_ label: String) {
        if let point = elements[label] {
            Mouse.leftClick(at: point)
        }
    }
}
