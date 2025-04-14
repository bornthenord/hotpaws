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
    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        keyborg = Keyborg()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

