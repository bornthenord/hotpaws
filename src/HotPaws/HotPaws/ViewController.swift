//
//  ViewController.swift
//  HotPaws
//
//  Created by cat dog on 07.06.2025.
//

import Cocoa

class ViewController: NSViewController {

    private let handleKeyUp: Event = Event()
    private let handleModifierChange: Event = Event()
    
    @IBOutlet weak var lastPressedKeyLabel: NSTextFieldCell!
    @IBOutlet weak var lastPressedKeyText: NSTextFieldCell!
    
    public static var instace: ViewController? = nil
    public static let lastPressedKeyLabelDefault: String = "Press the key"
    public static let unknownKeyText: String = "unknown key"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewController.instace = self
        
        handleKeyUp.subscribe(type: CGEventType.keyUp, handler: keyForDescHandler)
        handleModifierChange.subscribe(type: CGEventType.flagsChanged, handler: modifierForDescHandler)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

private func keyForDescHandler(
    _: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
        if let event = NSEvent(cgEvent: cgEvent) {
            var description: String = ViewController.unknownKeyText
            
            if let key = Key(rawValue: event.keyCode){
                description = key.description
                ViewController.instace!.lastPressedKeyLabel.stringValue = "Pressed key:"
            }
            
            ViewController.instace!.lastPressedKeyText.stringValue = description
        }
        
        return Unmanaged.passUnretained(cgEvent)
    }

private func modifierForDescHandler(
    _: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
        if let event = NSEvent(cgEvent: cgEvent) {
            var description: String = ViewController.unknownKeyText
            
            if let modifier = Modifier(rawValue: event.keyCode){
                description = modifier.description
                ViewController.instace!.lastPressedKeyLabel.stringValue = "Pressed modifier:"
            }
            
            ViewController.instace!.lastPressedKeyText.stringValue = description
        }
        
        return Unmanaged.passUnretained(cgEvent)
    }
