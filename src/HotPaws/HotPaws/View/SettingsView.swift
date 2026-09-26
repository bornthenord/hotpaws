//
//  ViewController.swift
//  HotPaws
//
//  Created by cat dog on 07.06.2025.
//

import Cocoa

class ViewController: NSViewController, NSTextViewDelegate {

    private var isClosing = false
    private var isHighlighting = false
    private var keyDetected: KeyDetected?
    private let sectionsDataSource = SectionsDataSource()
    
    @IBOutlet weak var lastPressedKeyText: NSTextFieldCell!
    
    @IBOutlet weak var mappintTextView: NSScrollView!
    @IBOutlet weak var sectionsScrollView: NSScrollView!
    
    public static var instace: ViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewController.instace = self
        ViewController.instace?.title = "Settings"
        
        initMapping(mapping: Config.mappingString)
        initSections()
        
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
    
    @IBAction func close(_ sender: Any) {
        self.view.window?.close()
    }
    
    @IBAction func apply(_ sender: Any) {
        do {
            if let txtView = mappintTextView.documentView as? NSTextView {
                try Config.save(mapping: txtView.string)
            }
        } catch {
            AlertView.alert(window: self.view.window!, text: "\(error)")
        }
    }
    
    @IBAction func modeChanged(_ sender: NSSegmentedControl) {
        let isIni = sender.selectedSegment == 0
        mappintTextView.isHidden = !isIni
        sectionsScrollView.isHidden = isIni
        
        if !isIni {
            reloadSections()
        }
    }
    
    private func initMapping(mapping: String) {
        guard let txtView = mappintTextView.documentView as? NSTextView else { return }
        
        txtView.string = mapping
        txtView.delegate = self
        txtView.isRichText = true
        highlightMapping()
    }
    
    private func initSections() {
        guard let outline = sectionsScrollView.documentView as? NSOutlineView else { return }
        
        outline.dataSource = sectionsDataSource
        outline.delegate = sectionsDataSource
        outline.headerView = nil
        reloadSections()
    }
    
    private func reloadSections() {
        guard let outline = sectionsScrollView.documentView as? NSOutlineView else { return }
        
        sectionsDataSource.reload(mapping: Config.mapping)
        outline.reloadData()
        outline.expandItem(nil, expandChildren: true)
    }
    
    private func highlightMapping() {
        guard let txtView = mappintTextView.documentView as? NSTextView else { return }
        guard !isHighlighting else { return }
        guard let storage = txtView.textStorage else { return }
        
        isHighlighting = true
        defer { isHighlighting = false }
        
        let highlighted = IniHighlighter.highlight(txtView.string)
        
        if !storage.isEqual(to: highlighted) {
            let selectedRanges = txtView.selectedRanges
            storage.setAttributedString(highlighted)
            txtView.selectedRanges = selectedRanges
        }
    }
    
    func textDidChange(_ notification: Notification) {
        highlightMapping()
    }
}