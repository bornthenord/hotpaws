//
//  Config.swift
//  Keyborg
//
//  Created by cat dog on 14.04.2025.
//

let file = """
    # vim
    h:left
    k:up
    j:down
    l:right
    #
    u:z:command
    y:c:command
    p:v:command
    x:delete
    s:left:option:command
    # tab navigation
    d:right:option:command
    #
    m:enter
    e:escape
    """

enum ConfigErrors: Error {
    case Invalid(String)
}

struct Config {
    public static var Mapping: [Key: (Keys: [Key], Modifiers: [Modifier]?)]?
    
    public static func load() throws {
        Mapping = try getConfig(content: file)
    }
    
    private static func getConfig(content: String) throws -> [Key: (Keys: [Key], Modifiers: [Modifier]?)] {
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
        
        return try Key.parse(key)
    }
    
    private static func toModifier(_ raw: String) throws -> Modifier {
        let modifier = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return try Modifier.parse(modifier)
    }
}
