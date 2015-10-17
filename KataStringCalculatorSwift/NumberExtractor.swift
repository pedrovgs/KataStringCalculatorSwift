//
//  NumberExtractor.swift
//  KataStringCalculatorSwift
//
//  Created by Pedro Vicente on 17/10/15.
//  Copyright © 2015 Pedro Vicente Gómez Sánchez. All rights reserved.
//

import Foundation

class NumberExtractor {
    
    func extract(input: String) throws -> [Int] {
        if input.isEmpty {
            return []
        } else if !isFirstCharAValidChar(input) {
            throw InvalidInputError.InvalidDelimiterFound(delimiter: String(input[0]))
        } else if isFirstCharADelimiter(input) {
            return try extract(input[1..<input.countChars()])
        } else if containsDelimiter(input) {
            let currentNumber = extractCurrentNumber(input)
            let restOfNumbersStartIndex = currentNumber.countChars()
            let restOfNumberEndIndex = input.countChars()
            let restOfNumbers = try extract(input[restOfNumbersStartIndex...restOfNumberEndIndex])
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
        return input.characters.filter({ (character) -> Bool in
            !character.isDigit() && character != "-"
        }).count > 0
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
            if !char.isDigit() && char != "-" {
                return String(char)
            }
        }
        return ""
    }
    
    private func isFirstCharAValidChar(input: String) -> Bool {
        let char = input[0]
        return char == "," || char ==  "\n" || char == "-" || char.isDigit()
    }

}
