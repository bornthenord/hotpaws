//
//  ViewController.swift
//  Keyborg
//
//  Created by cat dog on 16.04.2025.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet var status: NSTextView!
    
    @IBOutlet var text: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text.string = Repository.config
        text.font = .systemFont(ofSize: 16)
    }
    
    @IBAction func onClick(_ sender: Any) {
        do {
            Keyborg.config = try Parser.parse(text.string)
            Repository.config = text.string
            text.textColor = .black
            status.string = ""
        } catch {
            text.textColor = .red
            status.string = "\(error)"
        }
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
