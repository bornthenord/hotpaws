//
//  File.swift
//  HotPaws
//
//  Created by cat dog on 16.04.2025.
//

import Foundation


struct Config {
    private static let _keyMapping: String = "config"
    private static var _mapping: Dictionary<Modifier,Dictionary<Key,Mapping>> = [:]
    private static var _mappingString: String = """
        # navigation
        fn:h:left
        fn:k:up
        fn:j:down
        fn:l:right
        """

    public static var mapping: Dictionary<Modifier,Dictionary<Key,Mapping>> {
        _mapping
    }
    
    public static var mappingString: String {
        _mappingString
    }
    
    public static func load() throws {
        let mappingStr = UserDefaults.standard.string(forKey: _keyMapping)
        
        if mappingStr != nil {
            _mappingString = mappingStr!
        }
        
        _mapping = try ConfigParser.parse(_mappingString)
    }
    
    public static func save(mapping: String) throws {
        _mapping = try ConfigParser.parse(mapping)
        _mappingString = mapping
        
        UserDefaults.standard.set(mapping, forKey: _keyMapping)
    }
}
