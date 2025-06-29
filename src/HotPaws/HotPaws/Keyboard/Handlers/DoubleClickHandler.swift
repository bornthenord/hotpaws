//
//  DoubleClickHandler.swift
//  HotPaws
//
//  Created by cat dog on 26.06.2025.
//

import Foundation

struct QueueKey {
    var key: Key
    let date: Date
    var modifiers: Set<Modifier>
    
    init(key: Key, modifiers: Set<Modifier>) {
        self.date = Date()
        self.key = key
        self.modifiers = modifiers
    }
}

class DoubleClickHandler: KeyHandler {
    let decorated: KeyHandler
    var queue: Queue<QueueKey> = Queue()
    var timer: Timer?
    
    init(_ decorated: KeyHandler){
        self.decorated = decorated
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [weak self] _ in
            self?.queueHandler()
        }
        
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> KeyHandlerResult {
        if Config.mapping.containDoubleKeyRule {
            let next = QueueKey(key: key, modifiers: modifiers)
            queue.enqueue(next)
            
            return .handled
        }
        
        return self.decorated.handle(key: &key, modifiers: &modifiers)
    }
    
    private func queueHandler() {
        if var first = queue.dequeue() {
            if var second = queue.dequeue() {
                if first.key == second.key {
                    if first.date.timeIntervalSince(second.date) < 0.2 {
                        print("double")
                    } else {
                        if self.decorated.handle(key: &first.key, modifiers: &first.modifiers) == .skip {
                            Keyboard.press(key: first.key, modifiers: first.modifiers)
                        }
                        
                        if self.decorated.handle(key: &second.key, modifiers: &second.modifiers) == .skip {
                            Keyboard.press(key: second.key, modifiers: second.modifiers)
                        }
                    }
                } else {
                    if self.decorated.handle(key: &first.key, modifiers: &first.modifiers) == .skip {
                        Keyboard.press(key: first.key, modifiers: first.modifiers)
                    }
                    
                    if self.decorated.handle(key: &second.key, modifiers: &second.modifiers) == .skip {
                        Keyboard.press(key: second.key, modifiers: second.modifiers)
                    }
                }
            } else {
                if self.decorated.handle(key: &first.key, modifiers: &first.modifiers) == .skip {
                    Keyboard.press(key: first.key, modifiers: first.modifiers)
                }
            }
        }
    }
}
