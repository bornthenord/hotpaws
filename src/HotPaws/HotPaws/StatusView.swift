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
        
        StatusView.statusItem?.button?.image = NSImage(systemSymbolName: StatusView.systemSymbolName, accessibilityDescription: nil)
    }
}
