//
//  ViewController.swift
//  Keyborg
//
//  Created by cat dog on 16.04.2025.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet var text: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text.string = Repository.config
        text.font = .systemFont(ofSize: 16)
    }
    
    @IBAction func apply(_ sender: Any) {
        do {
            Keyborg.config = try Parser.parse(text.string)
            Repository.config = text.string
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
