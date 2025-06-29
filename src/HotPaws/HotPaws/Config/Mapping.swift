//
//  MappingRule.swift
//  HotPaws
//
//  Created by cat dog on 09.06.2025.
//


import Foundation

enum MappingErrors: Error {
    case TargetInvalid(_ target: String)
    case SourceInvalid(_ source: String)
    case ModifierInvalid(_ source: String)
    case RuleInvalid(_ source: String)
}

struct Mapping {
    let rules: Dictionary<Modifier,Dictionary<Key,MapRule>>
    let containDoubleKeyRule: Bool
    
    init(_ content: String) throws {
        var rules = Dictionary<Modifier,Dictionary<Key,MapRule>>()
        var currentSwitchModifier = MapModifier(Modifier.fn)
        var containDoubleKeyRule = false
        
        for raw in content.split(separator: "\n") {
            if raw.starts(with: "#") {
                continue
            }
            
            if raw.starts(with: "[") {
                currentSwitchModifier = try MapModifier(String(raw))
                continue
            }
            
            let rule = try Mapping.parseRule(String(raw))
            containDoubleKeyRule = rule.source.isDouble
            
            if rules.keys.contains(currentSwitchModifier.modifier) {
                rules[currentSwitchModifier.modifier]![rule.source.key] = rule
            } else {
                rules[currentSwitchModifier.modifier] = [rule.source.key: rule]
            }
        }
        
        self.containDoubleKeyRule = containDoubleKeyRule
        self.rules = rules
    }
    
    private static func parseRule(_ raw: String) throws -> MapRule {
        let items = raw.split(separator: ":")
        
        if items.count < 2 {
            throw MappingErrors.RuleInvalid(raw)
        }
        
        let source = try MapSource(String(items[0]))
        let target = try MapTarget(String(items[1]))
        
        var modifiers: Set<MapModifier>?
        
        if items.count == 3 {
            modifiers = try Mapping.parseModifiers(String(items[2]))
        }
        
        return MapRule(source: source, target: target, modifiers: modifiers)
    }
    
    private static func parseModifiers(_ modifiers: String) throws -> Set<MapModifier> {
        var result = Set<MapModifier>()
        let raws = modifiers.split(separator: ",")
        
        for raw in raws {
            result.insert(try MapModifier(String(raw)))
        }
        
        return result
    }
}

struct MapRule {
    let source: MapSource
    let target: MapTarget
    let modifiers: Set<MapModifier>?
}

struct MapSource: Hashable {
    let key: Key
    let isDouble: Bool
    
    init(_ raw: String) throws {
        var rawTrim = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        var isDouble = false
        var key = Key(from: rawTrim)
        
        if key == nil {
            if rawTrim.starts(with: "2") {
                key = Key(from: String(rawTrim.removeFirst()))
                isDouble = true
            }
            
            if key == nil {
                throw MappingErrors.SourceInvalid(raw)
            }
        }
        
        self.key = key!
        self.isDouble = isDouble
    }
}

enum TargetType: String {
    case KeyPress
    case Navigation

    init?(from raw: String) {
        let type = raw.lowercased()
        
        switch type {
        case "navigation":
            self = .Navigation
        default:
            if Key(from: type) != nil {
                self = .KeyPress
            } else {
                return nil
            }
        }
    }
}

struct MapTarget {
    let name: String
    let key: Key?
    let type: TargetType
    
    init(_ raw: String) throws {
        let name = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        let type = TargetType(from: name)
        
        if type == nil {
            throw MappingErrors.TargetInvalid(name)
        }
        
        self.name = name
        self.type = type!
        self.key = Key(from: name)
    }
}

struct MapModifier: Hashable {
    let modifier: Modifier
    
    init(_ modifier: Modifier) {
        self.modifier = modifier
    }
    
    init(_ raw: String) throws {
        var name = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        var modifier = Modifier(from: name)
        
        if modifier == nil {
            if name.starts(with: "[") {
                name = String(name.dropFirst())
                name = String(name.dropLast())
                
                modifier = Modifier(from: name)
                
                if modifier == nil {
                    throw MappingErrors.ModifierInvalid(raw)
                }
            }
        }
        
        self.modifier = modifier!
    }
}
