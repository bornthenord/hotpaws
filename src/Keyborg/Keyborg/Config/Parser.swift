//
//  Parser.swift
//  Keyborg
//
//  Created by cat dog on 16.04.2025.
//

import Foundation

enum ConfigErrors: Error {
    case Invalid(String)
}

struct Parser {
    public static func parse(_ content: String) throws -> [Key: (Keys: [Key], Modifiers: [Modifier]?)] {
        var result = [Key: (Keys: [Key], Modifiers: [Modifier]?)]()
        
        for raw in content.split(separator: "\n") {
            if raw.starts(with: "#") {
                continue
            }
            
            let map = try parseLine(String(raw))
            
            result[map.Key] = (map.Keys, map.Modifiers)
        }
        
        return result
    }
    
    private static func parseLine(_ raw: String) throws -> (Key: Key, Keys: [Key], Modifiers: [Modifier]?) {
        let items = raw.split(separator: ":")
        
        if items.count < 2 {
            throw ConfigErrors.Invalid(raw)
        }
        
        let key = try toKey(String(items[0]))
        let targetKeys = try parseKeys(String(items[1]))
        var modifiers: [Modifier]?
        
        if items.count == 3 {
            modifiers = try parseModifiers(String(items[2]))
        }
        
        return (key, targetKeys, modifiers)
    }
    
    private static func parseKeys(_ keys: String) throws -> [Key] {
        var result = [Key]()
        let raws = keys.split(separator: ",")
        
        for raw in raws {
            result.append(try toKey(String(raw)))
        }
        
        return result
    }
    
    private static func parseModifiers(_ modifiers: String) throws -> [Modifier] {
        var result = [Modifier]()
        let raws = modifiers.split(separator: ",")
        
        for raw in raws {
            result.append(try toModifier(String(raw)))
        }
        
        return result
    }
    
    private static func toKey(_ raw: String) throws -> Key {
        let key = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return try KeyParser.parseKey(key)
    }
    
    private static func toModifier(_ raw: String) throws -> Modifier {
        let modifier = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return try KeyParser.parseModifier(modifier)
    }
}
