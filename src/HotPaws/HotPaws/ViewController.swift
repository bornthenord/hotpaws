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
        
        configText.string = Repository.config
        configText.font = .systemFont(ofSize: 16)
        
        handleKeyUp.subscribe(type: CGEventType.keyUp, handler: keyForDescHandler)
        
        ViewController.instace?.title = "Settings"
        ViewController.instace?.controlKeyBox.addItems(withObjectValues: Modifier.GetAll())
    }
    
    @IBAction func apply(_ sender: Any) {
        do {
            HotSwap.config = try Parser.parse(configText.string)
            Repository.config = configText.string
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
