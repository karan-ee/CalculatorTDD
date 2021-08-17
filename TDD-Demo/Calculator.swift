//
//  Calculator.swift
//  TDD-Demo
//
//  Created by Brajesh Kumar on 04/08/21.
//  Copyright © 2021 Brajesh Kumar. All rights reserved.
//

import Foundation

class Calculator {
    private var memory = Memory()

    func add(_ x: Double, _ y: Double) -> Double{
        let result = x+y
        memory.add(x: x, operation: "+", y: y, result: result)
        return result
    }
    
    func multiply(_ x: Double, _ y: Double) -> Double{
        let result = x*y
        memory.add(x: x, operation: "*", y: y, result: result)
        return result
    }
    
    func divide(_ x: Double, _ y: Double) throws ->  Double {
        guard y != 0 else {
            throw CalculatorError.divideByZero
        }
        let value = x/y
        let result = trunc(value*1000000)/1000000.0
        memory.add(x: x, operation: "/", y: y, result: result)
        return result
    }
    
    func replay(_ howMany: Int) -> String {
        memory.replay(howMany)
    }
}

enum CalculatorError: Error {
    case divideByZero
}
