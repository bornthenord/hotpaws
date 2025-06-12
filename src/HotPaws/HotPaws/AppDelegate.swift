//
//  AppDelegate.swift
//  HotPaws
//
//  Created by cat dog on 14.04.2025.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var status: StatusView?
    
    @IBOutlet weak var menu: NSMenu?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // The application does not appear in the Dock and may not create
        // windows or be activated.
        NSApp.setActivationPolicy(.accessory)
        status = StatusView()
        StatusView.statusItem?.menu = menu
        
        do {
            try Config.load()
            try Keyboard.connect()
            
            Keyboard.keySubscribers["general"] = GeneralSectionHandler()
            Keyboard.keySubscribers["switch"] = SwitchHandler()
        } catch {
            print(error)
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}

