//
//  Parser.swift
//  HotPaws
//
//  Created by cat dog on 16.04.2025.
//

import Foundation

enum ConfigErrors: Error {
    case Invalid(String)
}

struct ConfigParser {
    public static func parse(_ content: String) throws -> Dictionary<Key,MappingRule> {
        var result = Dictionary<Key,MappingRule>()
        
        for raw in content.split(separator: "\n") {
            if raw.starts(with: "#") {
                continue
            }
            
            let rule = try parseLine(String(raw))
            
            result[rule.key] = rule
        }
        
        return result
    }
    
    private static func parseLine(_ raw: String) throws -> MappingRule {
        let items = raw.split(separator: ":")
        
        if items.count < 2 {
            throw ConfigErrors.Invalid(raw)
        }
        
        let key = try toKey(String(items[0]))
        let targetKeys = try parseKeys(String(items[1]))
        var modifiers: Set<Modifier>?
        
        if items.count == 3 {
            modifiers = try parseModifiers(String(items[2]))
        }
        
        return MappingRule(key: key, targetKeys: targetKeys, modifiers: modifiers)
    }
    
    private static func parseKeys(_ keys: String) throws -> Set<Key> {
        var result = Set<Key>()
        let raws = keys.split(separator: ",")
        
        for raw in raws {
            result.insert(try toKey(String(raw)))
        }
        
        return result
    }
    
    private static func parseModifiers(_ modifiers: String) throws -> Set<Modifier> {
        var result = Set<Modifier>()
        let raws = modifiers.split(separator: ",")
        
        for raw in raws {
            result.insert(try toModifier(String(raw)))
        }
        
        return result
    }
    
    private static func toKey(_ raw: String) throws -> Key {
        let key = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return try Key.parse(key)
    }
    
    private static func toModifier(_ raw: String) throws -> Modifier {
        let modifier = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return try Modifier.parse(modifier)
    }
}
