//
//  File.swift
//  HotPaws
//
//  Created by cat dog on 16.04.2025.
//

import Foundation


struct Config {
    private static let _keyMapping: String = "config"
    private static let _keyCapsLockisOnOff: String = "capsLockisOnOff"
    private static var _capsLockIsOnOff: Bool = false
    
    private static var _mapping: Dictionary<Modifier,Dictionary<Key,Mapping>> = [:]
    private static var _mappingString: String = """
        [fn]
        # navigation
        h:left
        k:up
        j:down
        l:right
        """

    public static var mapping: Dictionary<Modifier,Dictionary<Key,Mapping>> {
        _mapping
    }
    
    public static var mappingString: String {
        _mappingString
    }
    
    public static var capsLockIsOnOff: Bool {
        _capsLockIsOnOff
    }
    
    public static func load() throws {
        let mappingStr = UserDefaults.standard.string(forKey: _keyMapping)
        
        if mappingStr != nil {
            _mappingString = mappingStr!
        }
        
        _mapping = try ConfigParser.parse(_mappingString)
        
        _capsLockIsOnOff = UserDefaults.standard.bool(forKey: _keyCapsLockisOnOff)
    }
    
    public static func save(mapping: String, capsLockIsOnOff: Bool) throws {
        _mapping = try ConfigParser.parse(mapping)
        _mappingString = mapping
        
        UserDefaults.standard.set(mapping, forKey: _keyMapping)
        UserDefaults.standard.set(capsLockIsOnOff, forKey: _keyCapsLockisOnOff)
        
        _capsLockIsOnOff = capsLockIsOnOff
    }
}
