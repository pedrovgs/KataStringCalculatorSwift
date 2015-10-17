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
    
    func testShouldReturnTheSumOfTwoNumbersSeparatedByComas() {
        let stringCalculator = givenAStringCalculator()
        
        let sum = stringCalculator.add("1,2")
        
        XCTAssertEqual(3, sum)
    }
    
    func testShouldReturnTheSumOfThreeNumbersSeparatedByComas() {
        let stringCalculator = givenAStringCalculator()
        
        let sum = stringCalculator.add("1,2,3")
        
        XCTAssertEqual(6, sum)
    }
    
    func testShouldReturnTheSumOfAnUnkownAmountOfNumbersSeparatedByComas() {
        let stringCalculator = givenAStringCalculator()
        
        let sum = stringCalculator.add("1,2,3,1,2,3")
        
        XCTAssertEqual(12, sum)
    }
    
    func testShouldSupportNewLineDelimiterInsteadOfComas() {
        let stringCalculator = givenAStringCalculator()

        let sum = stringCalculator.add("1\n2\n3")

        XCTAssertEqual(6, sum)
    }

    private func givenAStringCalculator() -> StringCalculator {
        let numberExtractor = NumberExtractor()
        return StringCalculator(numberExtractor: numberExtractor)
    }
    
}
