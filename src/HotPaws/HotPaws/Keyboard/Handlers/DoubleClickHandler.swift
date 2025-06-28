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
        
        // Создаем и запускаем таймер при инициализации
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.queueHandler()
        }
        
        // Добавляем таймер в текущий RunLoop
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    func handle(key: inout Key, modifiers: inout Set<Modifier>) -> KeyHandlerResult {
        let next = QueueKey(key: key, modifiers: modifiers)
        queue.enqueue(next)
        
        return .handled
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
