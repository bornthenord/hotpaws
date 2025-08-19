//
//  Logger.swift
//  HotPaws
//
//  Created by cat dog on 21.06.2025.
//

import Foundation

class Logger {
    public static func info(_ message: Any) {
        log(level: "info", message)
    }
    
    public static func error(_ message: Any) {
        log(level: "error", message)
    }
    
    public static func panic(_ message: Any) {
        log(level: "panic", message)
    }
    
    private static func log(level: String, _ message: Any) {
        print("[\(level)][\(Date())] \(message)")
    }
}
