//
//  Calculator.swift
//  TDD-Demo
//
//  Created by Brajesh Kumar on 04/08/21.
//  Copyright © 2021 Brajesh Kumar. All rights reserved.
//

import Foundation

class Calculator {
    var memory: String = ""
    func add(_ x: Double, _ y: Double) -> Double{
        let result = x+y
        storeInMemory(x: x, operation: "+", y: y, result: result)
        return result
    }
    
    func multiply(_ x: Double, _ y: Double) -> Double{
        let result = x*y
        storeInMemory(x: x, operation: "*", y: y, result: result)
        return result
    }
    
    func divide(x: Double, y: Double) throws ->  Double {
        guard y != 0 else {
            throw CalculatorError.divideByZero
        }
        let value = x/y
        return trunc(value*1000000)/1000000.0
    }
    
    func replay() -> String {
        return memory
    }
    
    private func storeInMemory(x:Double, operation: String, y: Double, result: Double) {
        memory = memory.isEmpty ? memory : "\(memory); "
        memory += "\(x.format()) \(operation) \(y.format()) = \(result.format())"
    }
}

extension Double {
    func format() -> String {
        return String(format: "%.2f", self)
    }
}

enum CalculatorError: Error {
    case divideByZero
}
