//
//  KataStringCalculatorSwiftUnitTests.swift
//  KataStringCalculatorSwiftUnitTests
//
//  Created by Pedro Vicente on 14/10/15.
//  Copyright © 2015 Pedro Vicente Gómez Sánchez. All rights reserved.
//

import XCTest

class KataStringCalculatorSwiftUnitTests: XCTestCase {
    
    func testShouldReturnZeroIfTheStringIsEmpty() {
        let stringCalculator = givenAStringCalculator()
        
        let sum = stringCalculator.add("")
        
        XCTAssertEqual(0, sum)
    }
    
    func testShouldReturnTheContentOfTheStringIfTheInputContainsJustOneNumber() {
        let stringCalculator = givenAStringCalculator()
        
        let sum = stringCalculator.add("1")
        
        XCTAssertEqual(1, sum)
    }
    
    func testShouldReturnTheContentOfTheStringIfTheInputContainsJustOneNumberWithMoreThanOneDigit() {
        let stringCalculator = givenAStringCalculator()
        
        let sum = stringCalculator.add("11")
        
        XCTAssertEqual(11, sum)
    }
    
    func testShouldReturnTheSumOfTwoNumbersSeparatedByComa() {
        let stringCalculator = givenAStringCalculator()
        
        let sum = stringCalculator.add("1,2")
        
        XCTAssertEqual(3, sum)
    }
    
    private func givenAStringCalculator() -> StringCalculator {
        let numberExtractor = NumberExtractor()
        return StringCalculator(numberExtractor: numberExtractor)
    }
    
}
