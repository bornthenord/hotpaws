//
//  Navigation.swift
//  HotPaws
//
//  Created by cat dog on 20.06.2025.
//

import Foundation
import AppKit

class Navigation {
    // Функция для поиска кликабельных элементов
    func findClickableElements() -> [NSView] {
        // Получаем главное окно приложения
        guard let window = NSApp.keyWindow else { return [] }
        
        var clickableElements: [NSView] = []
        
        // Рекурсивная функция для обхода всех подвью
        func traverseViews(_ view: NSView) {
            // Проверяем тип элемента и его активность
            if !view.isHidden {
                if view is NSControl && !(view is NSTextView) {
                    clickableElements.append(view)
                }
            }
            
            // Рекурсивно проходим по всем подвью
            for subview in view.subviews {
                traverseViews(subview)
            }
        }
        
        // Начинаем обход с корневого view
        traverseViews(window.contentView ?? NSView())
        
        return clickableElements
    }
    
    func addCenteredLabel(to view: NSView, withText text: String) {
        // Создаем лейбл
        let label = NSTextField(labelWithString: text)
        label.textColor = .systemPink
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Добавляем лейбл как сабвью к кнопке
        view.addSubview(label)
        
        // Центрируем лейбл по горизонтали и вертикали внутри кнопки
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
