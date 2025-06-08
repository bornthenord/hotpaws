//
//  File.swift
//  HotPaws
//
//  Created by cat dog on 16.04.2025.
//

import Foundation


struct Config {
    private static let _keyConfig: String = "config"
    private static var _contentConfig: String?
    
    private static let _keyControlKey: String = "controlKey"
    private static var _keyControl: Modifier?
    
    private static var defaultControlKey: Modifier {
        get {
            return .function
        }
    }

    private static let defaultConfig: String = """
        # navigation
        h:left
        k:up
        j:down
        l:right
        # cmd z,c,v, del
        u:z:command
        y:c:command
        p:v:command
        x:delete
        # go to begin/end
        e:right:option
        b:left:option
        # tab navigation
        s:left:option,command
        d:right:option,command
        """
    
    public static var mapping: String {
        get {
            if _contentConfig == nil {
                _contentConfig = UserDefaults.standard.string(forKey: _keyConfig) ?? defaultConfig
            }
            
            return _contentConfig!
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: _keyConfig)
            _contentConfig = newValue
        }
    }
    
    public static var controlKey: Modifier {
        get {
            if _keyControl == nil {
                let keyStr = UserDefaults.standard.string(forKey: _keyControlKey)
                
                if keyStr == nil {
                    _keyControl = defaultControlKey
                } else {
                    do {
                        _keyControl = try Modifier.parse(keyStr!)
                    } catch {
                        _keyControl = defaultControlKey
                    }
                }
            }
            
            return _keyControl!
        }
        
        set {
            UserDefaults.standard.set(newValue.description, forKey: _keyControlKey)
            _keyControl = newValue
        }
    }
}
