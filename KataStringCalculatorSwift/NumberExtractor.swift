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
        } else if isFirstCharADelimiter(input) {
            return extract(input[1..<input.countChars()])
        } else if containsDelimiter(input) {
            let currentNumber = extractCurrentNumber(input)
            let restOfNumbers = extract(input[currentNumber.countDigits()...input.countChars()])
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
    
    private func containsDelimiter(input: String) -> Bool {
        return input.containsString(",")
    }
    
    private func isFirstCharADelimiter(input: String) -> Bool {
        return input[input.startIndex] == ","
    }
    
}
