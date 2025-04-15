//
//  StatusView.swift
//  Keyborg
//
//  Created by cat dog on 15.04.2025.
//

import Cocoa

class StatusView {
    static let systemSymbolNameOn = "cube.fill"
    static let systemSymbolNameOff = "cube"
    private let modifiedChange: Event?
    
    public static var enabled: Bool = false
    public static var statusItem: NSStatusItem?
    
    init() {
        modifiedChange = Event()
        modifiedChange?.subscribe(type: CGEventType.flagsChanged, handler: handleModifierChanged)
        
        StatusView.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        StatusView.statusItem?.button?.image = NSImage(systemSymbolName: StatusView.systemSymbolNameOff, accessibilityDescription: nil)
    }
    
    static func enable() {
        if !StatusView.enabled {
            StatusView.statusItem?.button?.image = NSImage(systemSymbolName: StatusView.systemSymbolNameOn, accessibilityDescription: nil)
            StatusView.enabled = true
            print("on")
        }
    }
    
    static func disable() {
        if StatusView.enabled {
            StatusView.statusItem?.button?.image = NSImage(systemSymbolName: StatusView.systemSymbolNameOff, accessibilityDescription: nil)
            StatusView.enabled = false
            print("off")
        }
    }
}

private func handleModifierChanged(
    _: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
        if let event = NSEvent(cgEvent: cgEvent),
           event.modifierFlags.contains(.capsLock) {
            StatusView.enable()
        } else {
            StatusView.disable()
        }
        
        return Unmanaged.passUnretained(cgEvent)
    }
