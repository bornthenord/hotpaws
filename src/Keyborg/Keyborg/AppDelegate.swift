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
    var status: StatusView?
    
    @IBOutlet weak var menu: NSMenu?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        do {
            try Config.load()
            
            keyborg = Keyborg()
            status = StatusView()
            
            // The application does not appear in the Dock and may not create
            // windows or be activated.
            NSApp.setActivationPolicy(.accessory)
            
            StatusView.statusItem?.menu = menu

        } catch {
            print(error)
            return
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}

