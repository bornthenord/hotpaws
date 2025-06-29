//
//  DoubleClickHandler.swift
//  HotPaws
//
//  Created by cat dog on 26.06.2025.
//

import Foundation

struct QueueClick {
    var click: Click
    let date: Date
    var modifiers: Set<Modifier>
    
    init(click: Click, modifiers: Set<Modifier>) {
        self.date = Date()
        self.click = click
        self.modifiers = modifiers
    }
}

class DoubleClickHandler: ClickHandler {
    let decorated: ClickHandler
    var queue: Queue<QueueClick> = Queue()
    var timer: Timer?
    
    init(_ decorated: ClickHandler){
        self.decorated = decorated
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [weak self] _ in
            self?.queueHandler()
        }
        
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    func handle(_ click: Click, modifiers: inout Set<Modifier>) -> HandlerResult {
        if Config.mapping.doubleRules.contains(click.key) {
            let next = QueueClick(click: click, modifiers: modifiers)
            queue.enqueue(next)
            
            return .handled
        }
        
        return self.decorated.handle(click, modifiers: &modifiers)
    }
    
    private func queueHandler() {
        if var first = queue.dequeue() {
            if var second = queue.dequeue() {
                if first.click.key == second.click.key {
                    if first.date.timeIntervalSince(second.date) < 0.2 {
                        let _ = self.decorated.handle(first.click.toDouble(), modifiers: &first.modifiers)
                    } else {
                        if self.decorated.handle(first.click, modifiers: &first.modifiers) == .skip {
                            Keyboard.click(key: first.click.key, modifiers: first.modifiers)
                        }
                        
                        if self.decorated.handle(second.click, modifiers: &second.modifiers) == .skip {
                            Keyboard.click(key: second.click.key, modifiers: second.modifiers)
                        }
                    }
                } else {
                    if self.decorated.handle(first.click, modifiers: &first.modifiers) == .skip {
                        Keyboard.click(key: first.click.key, modifiers: first.modifiers)
                    }
                    
                    if self.decorated.handle(second.click, modifiers: &second.modifiers) == .skip {
                        Keyboard.click(key: second.click.key, modifiers: second.modifiers)
                    }
                }
            } else {
                if self.decorated.handle(first.click, modifiers: &first.modifiers) == .skip {
                    Keyboard.click(key: first.click.key, modifiers: first.modifiers)
                }
            }
        }
    }
}
