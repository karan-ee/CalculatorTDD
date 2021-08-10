//
//  Calculator.swift
//  TDD-Demo
//
//  Created by Brajesh Kumar on 04/08/21.
//  Copyright © 2021 Brajesh Kumar. All rights reserved.
//

import Foundation

class Calculator {
    func add(_ x: Double, _ y: Double) -> Double{
        return x+y
    }
    
    func multiply(_ x: Double, _ y: Double) -> Double{
        return x*y
    }
    
    func divide(x: Double, y: Double) throws ->  Double {
        guard y != 0 else {
            throw CalculatorError.divideByZero
        }
        let value = x/y
        return trunc(value*1000000)/1000000.0
    }
}

enum CalculatorError: Error {
    case divideByZero
}
