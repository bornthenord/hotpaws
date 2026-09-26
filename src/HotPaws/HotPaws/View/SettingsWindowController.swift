//
//  SettingsWindowController.swift
//  HotPaws
//
//  Created by cat dog on 26.09.2026.
//

import Cocoa

class SettingsWindowController: NSWindowController {
    override func showWindow(_ sender: Any?) {
        NSApp.activate(ignoringOtherApps: true)
        super.showWindow(sender)
    }
}