//
//  ViewController.swift
//  HotPaws
//
//  Created by cat dog on 07.06.2025.
//

import Cocoa
import AppKit

class ViewController: NSViewController {

    private var isClosing = false
    private var keyDetected: KeyDetected?
    
    @IBOutlet weak var lastPressedKeyText: NSTextFieldCell!
    @IBOutlet var mappingText: NSTextView!
    
    public static var instace: ViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewController.instace = self
        ViewController.instace?.title = "Settings"
        
        initMapping(mapping: Config.mappingString)
        
        keyDetected = KeyDetected(textView: self.lastPressedKeyText)
    }
        
    override func viewWillDisappear() {
        // Method called at start and when the window is closed.
        if isClosing {
            keyDetected!.close()
        }
        
        isClosing = true
        
        super.viewDidDisappear()
    }
    
    @IBAction func apply(_ sender: Any) {
        do {
            try Config.save(mapping: mappingText.string)
            
            AlertView.alert(window: self.view.window!, text: "Applied")
        } catch {
            AlertView.alert(window: self.view.window!, text: "\(error)")
        }
    }
    
    @IBAction func click(_ sender: Any) {
        var n = Navigation()
        // Пример использования
        let clickableItems = n.findClickableElements()
        for item in clickableItems {
            print("  Класс: \(type(of: item))")
            n.addCenteredLabel(to: item, withText: "AAA")
        }
    }
    
    private func initMapping(mapping: String) {
        mappingText.string = mapping
        mappingText.font = .systemFont(ofSize: 16)
    }
}
