//
//  ViewController.swift
//  HotPaws
//
//  Created by cat dog on 07.06.2025.
//

import Cocoa

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
    
    private func initMapping(mapping: String) {
        mappingText.string = mapping
        mappingText.font = .systemFont(ofSize: 16)
    }
}
