//
//  Queue.swift
//  HotPaws
//
//  Created by cat dog on 28.06.2025.
//

import Foundation


struct Queue<T> {
    private var elements: [T] = []

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }

    mutating func dequeue() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
    
    func peek() -> T? {
        return elements.first
    }
}
