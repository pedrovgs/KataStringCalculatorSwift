//
//  Extensions.swift
//  KataStringCalculatorSwift
//
//  Created by Pedro Vicente on 17/10/15.
//  Copyright © 2015 Pedro Vicente Gómez Sánchez. All rights reserved.
//

import Foundation

extension String {
    
    subscript(integerIndex: Int) -> Character {
        let index = self.startIndex.advancedBy(integerIndex)
        return self[index]
    }
    
    subscript(integerRange: Range<Int>) -> String {
        let start = self.startIndex.advancedBy(integerRange.startIndex)
        let end = self.startIndex.advancedBy(min(self.characters.count, integerRange.endIndex))
        let range = start..<end
        return self[range]
    }
    
    func countChars() -> Int {
        return characters.count
    }

}

extension Character {

    func isDigit() -> Bool {
        let string = String(self).unicodeScalars
        let uni = string[string.startIndex]
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        return digits.longCharacterIsMember(uni.value)
    }

}

extension Int {

    func countChars() -> Int {
        var sum = self < 0 ? 1 : 0
        var n = abs(self)
        while n > 0 {
            sum++
            n /= 10
        }
        return sum
    }
}