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
    
    private func givenAStringCalculator() -> StringCalculator {
        return StringCalculator()
    }
    
}
