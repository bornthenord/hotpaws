//
//  File.swift
//  HotPaws
//
//  Created by cat dog on 16.04.2025.
//

import Foundation


struct MappingRule {
    var key: Key
    var targetKeys: Set<Key>
    var modifiers: Set<Modifier>?
}

struct Config {
    private static let _keyMapping: String = "mapping"
    private static var _mapping: Dictionary<Key,MappingRule> = [:]
    private static var _mappingString: String = """
        # navigation
        h:left
        k:up
        j:down
        l:right
        """
    
    private static let _keyControlKey: String = "controlKey"
    private static var _keyControl: Modifier = .fn

    public static var controlKey: Modifier {
        _keyControl
    }
    
    public static var mapping: Dictionary<Key,MappingRule> {
        _mapping
    }
    
    public static var mappingString: String {
        _mappingString
    }
    
    public static func load() throws {
        let keyStr = UserDefaults.standard.string(forKey: _keyControlKey)
        if keyStr != nil {
            _keyControl =  try Modifier.parse(keyStr!)
        }
        
        let mappingStr = UserDefaults.standard.string(forKey: _keyMapping)
        if mappingStr != nil {
            _mappingString = mappingStr!
            _mapping = try ConfigParser.parse(mappingStr!)
        }
    }
    
    public static func save(controlKey: String, mapping: String) throws {
        _keyControl = try Modifier.parse(controlKey)
        _mapping = try ConfigParser.parse(mapping)
        _mappingString = mapping
        
        UserDefaults.standard.set(controlKey, forKey: _keyControlKey)
        UserDefaults.standard.set(mapping, forKey: _keyMapping)
    }
}
