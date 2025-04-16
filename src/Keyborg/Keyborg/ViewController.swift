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
    }
    
    @IBAction func onClick(_ sender: Any) {
        do {
            Keyborg.config = try Parser.parse(text.string)
            Repository.config = text.string
            
        } catch {
            text.string = "\(error)"
        }
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
