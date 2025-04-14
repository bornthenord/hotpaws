//
//  AppDelegate.swift
//  Keyborg
//
//  Created by cat dog on 14.04.2025.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var keyborg: Keyborg?
    var statusItem: NSStatusItem?
    @IBOutlet weak var menu: NSMenu?
    @IBOutlet weak var firstMenuItem: NSMenuItem?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        keyborg = Keyborg()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem?.menu = menu
        
        statusItem?.button?.title = "keyborg"
        //        statusItem?.button?.image = NSImage(systemSymbolName: "hand.raised.square.on.square", accessibilityDescription: nil)
        
        // The application does not appear in the Dock and may not create
        // windows or be activated.
        NSApp.setActivationPolicy(.accessory)
    }
}

