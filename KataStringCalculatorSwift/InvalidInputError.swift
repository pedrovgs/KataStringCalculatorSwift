//
//  NegativeNumbersFoundException.swift
//  KataStringCalculatorSwift
//
//  Created by Pedro Vicente on 17/10/15.
//  Copyright © 2015 Pedro Vicente Gómez Sánchez. All rights reserved.
//

import Foundation

enum InvalidInputError: ErrorType {

    case NegativeNumbersFound(numbers: [Int])
    case InvalidDelimiterFound(delimiter: String)

}