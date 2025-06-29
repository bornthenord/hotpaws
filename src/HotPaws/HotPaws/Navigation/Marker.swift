//
//  Marker.swift
//  HotPaws
//
//  Created by cat dog on 21.06.2025.
//

import Foundation

class Marker {
    private var currentIndex: Int = 0
    private let totalCombinations = 26 * 26
    
    func next() -> String {
        if currentIndex > totalCombinations {
            currentIndex = 0
        }
        
        let firstLetterIndex = currentIndex / 26
        let secondLetterIndex = currentIndex % 26
        
        let firstLetter = Character(UnicodeScalar(65 + firstLetterIndex)!).lowercased() // 'A' = 65
        let secondLetter = Character(UnicodeScalar(65 + secondLetterIndex)!).lowercased()
        
        currentIndex += 1
        
        return "\(firstLetter)\(secondLetter)"
    }
}
