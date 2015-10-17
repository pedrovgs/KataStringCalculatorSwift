//
//  NumberExtractor.swift
//  KataStringCalculatorSwift
//
//  Created by Pedro Vicente on 17/10/15.
//  Copyright © 2015 Pedro Vicente Gómez Sánchez. All rights reserved.
//

import Foundation

class NumberExtractor {
    
    func extract(input: String) -> [Int] {
        if input.isEmpty {
            return []
        } else if input[input.startIndex] == "," {
            return extract(input[1..<input.characters.count])
        } else if input.containsString(",") {
            let currentNumber = extractCurrentNumber(input)
            let restOfNumbers = extract(input[currentNumber.countDigits()...input.characters.count])
            return [currentNumber] + restOfNumbers
        } else {
            return [extractCurrentNumber(input)]
        }
    }
    
    private func extractCurrentNumber(input: String) -> Int {
        if input.containsString(",") {
            let nextDelimiterIndex = input.rangeOfString(",")
            let stringNumber = input.substringToIndex(nextDelimiterIndex!.endIndex.predecessor())
            return Int(stringNumber)!
        } else {
            return Int(input)!
        }
        
    }
}

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
}

extension Int {
    func countDigits() -> Int {
        var n = self
        var sum = 0
        while n > 0 {
            sum += n % 10
            n /= 10
        }
        return sum
    }
}