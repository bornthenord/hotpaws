//
//  Logger.swift
//  HotPaws
//
//  Created by cat dog on 21.06.2025.
//

import Foundation

class Logger {
    public static func info(_ message: Any) {
        print("info | \(message)")
    }
    
    public static func error(_ message: Any) {
        print("error | \(message)")
    }
    
    public static func panic(_ message: Any) {
        print("panic | \(message)")
    }
}
