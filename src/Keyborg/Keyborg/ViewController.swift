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
        
        text.string = File.content
    }
    
    @IBAction func onClick(_ sender: Any) {
        print(text.string)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
