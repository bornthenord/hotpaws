//
//  File.swift
//  HotPaws
//
//  Created by cat dog on 16.04.2025.
//

import Foundation


struct Repository {
    private static let _key: String = "config"
    private static var _content: String?
    
    public static var config: String {
        get {
            if _content == nil {
                _content = UserDefaults.standard.string(forKey: _key) ?? DefaultConfig
            }
            
            return _content!
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: _key)
            _content = newValue
        }
    }
}
