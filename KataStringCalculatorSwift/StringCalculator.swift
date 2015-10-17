//
//  StringCalculator.swift
//  KataStringCalculatorSwift
//
//  Created by Pedro Vicente on 14/10/15.
//  Copyright © 2015 Pedro Vicente Gómez Sánchez. All rights reserved.
//

import Foundation

class StringCalculator {
    
    func add(numbers: String) -> Int {
        if numbers.isEmpty {
            return 0
        }else {
            return Int(numbers)!
        }
    }
}