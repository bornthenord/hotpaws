//
//  ViewController.swift
//  HotPaws
//
//  Created by cat dog on 07.06.2025.
//

import Cocoa

class ViewController: NSViewController {

    private var keyDetected: KeyDetected?
    
    @IBOutlet weak var lastPressedKeyText: NSTextFieldCell!
    @IBOutlet var mappingText: NSTextView!
    @IBOutlet weak var controlKeyBox: NSComboBox!
    
    public static var instace: ViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewController.instace = self
        ViewController.instace?.title = "Settings"
        
        initControlKeyBox(selectedKey: Config.controlKey)
        initMapping(mapping: Config.mappingString)
        
        keyDetected = KeyDetected(textView: self.lastPressedKeyText)
    }
    
    @IBAction func apply(_ sender: Any) {
        do {
            try Config.save(controlKey: controlKeyBox.stringValue, mapping: mappingText.string)
            
            AlertView.alert(window: self.view.window!, text: "Applied")
        } catch {
            AlertView.alert(window: self.view.window!, text: "\(error)")
        }
    }
    
    private func initControlKeyBox(selectedKey: Modifier) {
        for modifier in Modifier.allCases{
            ViewController.instace?
                .controlKeyBox.insertItem(withObjectValue: modifier.description, at: 0)
        }
        
        ViewController.instace?.controlKeyBox.selectItem(withObjectValue: selectedKey.description)
    }
    
    private func initMapping(mapping: String) {
        mappingText.string = mapping
        mappingText.font = .systemFont(ofSize: 16)
    }
}
