//
//  StatusView.swift
//  HotPaws
//
//  Created by cat dog on 15.04.2025.
//

import Cocoa

class StatusView {
    static let systemSymbolName = "flame.fill"
    
    public static var statusItem: NSStatusItem?
    
    init() {
        StatusView.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        StatusView.statusItem?.button?.image = StatusView.statusImage()
        StatusView.statusItem?.button?.toolTip = "HotPaws"
    }
    
    private static func statusImage() -> NSImage? {
        if let url = Bundle.main.url(forResource: "logo", withExtension: "png"),
           let image = NSImage(contentsOf: url) {
            image.size = NSSize(width: 26, height: 26)
            image.isTemplate = true
            return image
        }
        
        if let url = Bundle.main.url(forResource: "logo", withExtension: "jpeg"),
           let image = NSImage(contentsOf: url) {
            image.size = NSSize(width: 20, height: 20)
            return image
        }
        
        return NSImage(systemSymbolName: systemSymbolName, accessibilityDescription: nil)
    }
}
