//
//  ViewController.swift
//  HotPaws
//
//  Created by cat dog on 07.06.2025.
//

import Cocoa

class ViewController: NSViewController {
    
    private let handleKeyUp: Event = Event()
    
    @IBOutlet weak var lastPressedKeyText: NSTextFieldCell!
    @IBOutlet var configText: NSTextView!
    @IBOutlet weak var controlKeyBox: NSComboBox!
    
    public static var instace: ViewController? = nil
    public static let unknownKeyText: String = "unknown key"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewController.instace = self
        ViewController.instace?.title = "Settings"
        
        for modifier in Modifier.allCases{
            ViewController.instace?
                .controlKeyBox.insertItem(withObjectValue: modifier.description, at: 0)
        }
        
        ViewController.instace?.controlKeyBox.selectItem(withObjectValue: Config.controlKey.description)
        
        configText.string = Config.mapping
        configText.font = .systemFont(ofSize: 16)
        
        handleKeyUp.subscribe(type: CGEventType.keyUp, handler: keyForDescHandler)
    }
    
    @IBAction func apply(_ sender: Any) {
        do {
            HotSwap.mapping = try Parser.parse(configText.string)
            let controlKey = try KeyParser.parseModifier(controlKeyBox.stringValue)
            Config.controlKey = controlKey
            Config.mapping = configText.string
            
            alert(text: "Applied")
        } catch {
            alert(text: "\(error)")
        }
    }
    
    private func alert(text: String) {
        let alert = NSAlert()
        alert.messageText = text
        alert.beginSheetModal(for: self.view.window!)
    }
}

private func keyForDescHandler(
    _: CGEventTapProxy,_: CGEventType,cgEvent: CGEvent,_: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
        if ViewController.instace?.lastPressedKeyText.isAccessibilityFocused() == true {
            if let event = NSEvent(cgEvent: cgEvent) {
                var description: String = ViewController.unknownKeyText
                
                if let key = Key(rawValue: event.keyCode){
                    description = key.description
                }
                
                ViewController.instace!.lastPressedKeyText.stringValue = description
            }
        }
        
        return Unmanaged.passUnretained(cgEvent)
    }
