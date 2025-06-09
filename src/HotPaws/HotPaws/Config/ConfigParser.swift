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
    public static func parse(_ content: String) throws -> Dictionary<Modifier,Dictionary<Key,Mapping>> {
        var layers = Dictionary<Modifier,Dictionary<Key,Mapping>>()
        
        for raw in content.split(separator: "\n") {
            if raw.starts(with: "#") {
                continue
            }
            
            let layer = try parseLine(String(raw))
            
            if layers.keys.contains(layer.switchModifier) {
                layers[layer.switchModifier]![layer.mapping.key] = layer.mapping
            } else {
                layers[layer.switchModifier] = [layer.mapping.key: layer.mapping]
            }
        }
        
        return layers
    }
    
    private static func parseLine(_ raw: String) throws -> (switchModifier: Modifier, mapping: Mapping) {
        let items = raw.split(separator: ":")
        
        if items.count < 3 {
            throw ConfigErrors.Invalid(raw)
        }
        
        let switchModifier = try toModifier(String(items[0]))
        let key = try toKey(String(items[1]))
        let targets = try parseKeys(String(items[2]))
        var modifiers: Set<Modifier>?
        
        if items.count == 4 {
            modifiers = try parseModifiers(String(items[3]))
        }
        
        return (switchModifier, Mapping(key: key, targets: targets, modifiers: modifiers))
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
