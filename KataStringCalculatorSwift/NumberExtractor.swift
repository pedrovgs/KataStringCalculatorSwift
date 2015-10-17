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
            let restOfNumbersStartIndex = currentNumber.countChars()
            let restOfNumberEndIndex = input.countChars()
            let restOfNumbers = extract(input[restOfNumbersStartIndex...restOfNumberEndIndex])
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
        let delimiter = getNextDelimiter(input)
        if input.containsString(delimiter) {
            return String(input[input.startIndex]) == delimiter
        } else {
            return false
        }

    }

    private func getNextDelimiterIndex(input: String) -> Range<String.CharacterView.Index>? {
        let delimiter = getNextDelimiter(input)
        if input.containsString(delimiter) {
            return input.rangeOfString(delimiter)
        } else {
            return nil
        }
    }

    private func getNextDelimiter(input: String) -> String {
        for char in input.characters {
            if char == "," || char == "\n" {
                return String(char)
            }
        }
        return ""
    }
    
}
