//
//  File.swift
//  HotPaws
//
//  Created by cat dog on 16.04.2025.
//

import Foundation


struct Repository {
    private static let _keyConfig: String = "config"
    private static var _contentConfig: String?
    
    private static let _keyControlKey: String = "controlKey"
    private static var _keyControl: Modifier?
    
    public static var config: String {
        get {
            if _contentConfig == nil {
                _contentConfig = UserDefaults.standard.string(forKey: _keyConfig) ?? DefaultConfig
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
                    _keyControl = DefaultControlKey
                } else {
                    do {
                        _keyControl = try KeyParser.parseModifier(keyStr!)
                    } catch {
                        _keyControl = DefaultControlKey
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
