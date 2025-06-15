//
//  File.swift
//  HotPaws
//
//  Created by cat dog on 16.04.2025.
//

import Foundation


struct Config {
    private static let _keyMapping: String = "config"
    private static var _mapping: Dictionary<Button,Dictionary<Button,Mapping>> = [:]
    private static var _mappingString: String = """
        [fn]
        # navigation
        h:left
        k:up
        j:down
        l:right
        """
    
    private static let _mouseCursorStepKey = "mouseCursorStep"
    private static var _mouseCursorStep: Double = 5
    
    public static var mapping: Dictionary<Button,Dictionary<Button,Mapping>> {
        _mapping
    }
    
    public static var mappingString: String {
        _mappingString
    }
    
    public static var mouseCursorStep: Double {
        _mouseCursorStep
    }
    
    public static func load() throws {
        let mappingStr = UserDefaults.standard.string(forKey: _keyMapping)
        
        if mappingStr != nil {
            _mappingString = mappingStr!
        }
        
        _mapping = try ConfigParser.parse(_mappingString)

        _mouseCursorStep = UserDefaults.standard.double(forKey: _mouseCursorStepKey)
    }
    
    public static func save(mapping: String, mouseCursorStep: Double) throws {
        _mapping = try ConfigParser.parse(mapping)
        _mappingString = mapping
        _mouseCursorStep = mouseCursorStep
        
        UserDefaults.standard.set(mapping, forKey: _keyMapping)
        UserDefaults.standard.set(_mouseCursorStep, forKey: _mouseCursorStepKey)
    }
}
