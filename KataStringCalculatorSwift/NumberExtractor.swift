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
        if containsDelimiter(input) {
            let nextDelimiterIndex = getNextDelimiterIndex(input)
            let stringNumber = input.substringToIndex(nextDelimiterIndex!.endIndex.predecessor())
            return Int(stringNumber)!
        } else {
            return Int(input)!
        }
        
    }
    
    private func containsDelimiter(input: String) -> Bool {
        return input.containsString(",") || input.containsString("\n")
    }
    
    private func isFirstCharADelimiter(input: String) -> Bool {
        if input.containsString(",") {
            return input[input.startIndex] == ","
        } else if input.containsString("\n") {
            return input[input.startIndex] == "\n"
        } else {
            return false
        }

    }

    private func getNextDelimiterIndex(input: String) -> Range<String.CharacterView.Index>? {
        if input.containsString(",") {
            return input.rangeOfString(",")
        } else if input.containsString("\n") {
            return input.rangeOfString("\n")
        } else {
            return nil
        }
    }
    
}
