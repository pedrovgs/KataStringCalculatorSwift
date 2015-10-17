//
//  StringCalculator.swift
//  KataStringCalculatorSwift
//
//  Created by Pedro Vicente on 14/10/15.
//  Copyright © 2015 Pedro Vicente Gómez Sánchez. All rights reserved.
//

import Foundation

class StringCalculator {
    
    private let numberExtractor: NumberExtractor
    
    init(numberExtractor: NumberExtractor) {
        self.numberExtractor = numberExtractor
    }
    
    func add(input: String) throws -> Int  {
        let numbers = extractNumbers(input)
        try validateNumbers(numbers)
        return sumNumbers(numbers)
    }
    
    private func extractNumbers(input: String) -> [Int] {
        return numberExtractor.extract(input)
    }
    
    private func validateNumbers(numbers: [Int]) throws {
        let negativeNumbers = numbers.filter { (number) -> Bool in
            number < 0
        }

        if negativeNumbers.count > 0 {
            throw InvalidInputError.NegativeNumbersFound(numbers: negativeNumbers)
        }
    }

    private func sumNumbers(numbers: [Int]) -> Int {
        return numbers.reduce(0, combine: { (accumulator, element) in
            return accumulator + element
        })
    }
}