//
//  Calculator.swift
//  TDD-Demo
//
//  Created by Brajesh Kumar on 04/08/21.
//  Copyright © 2021 Brajesh Kumar. All rights reserved.
//

import Foundation

class Calculator {
    var memory = [String]()

    func add(_ x: Double, _ y: Double) -> Double{
        let result = x+y
        addToMemory(x: x, operation: "+", y: y, result: result)
        return result
    }
    
    func multiply(_ x: Double, _ y: Double) -> Double{
        let result = x*y
        addToMemory(x: x, operation: "*", y: y, result: result)
        return result
    }
    
    func divide(_ x: Double, _ y: Double) throws ->  Double {
        guard y != 0 else {
            throw CalculatorError.divideByZero
        }
        let value = x/y
        let result = trunc(value*1000000)/1000000.0
        addToMemory(x: x, operation: "/", y: y, result: result)
        return result
    }
    
    func replay(_ howMany: Int) -> String {
        if howMany <= 0 {
            return ""
        }

        let operationsToReturn = memory
            .prefix(howMany)
            .joined(separator: "; ")

        return operationsToReturn.isEmpty
            ? "Nothing To Replay"
            : operationsToReturn
    }
    
    private func addToMemory(x:Double, operation: String, y: Double, result: Double) {
        let result = "\(x.format()) \(operation) \(y.format()) = \(result.format())"
        memory.append(result)
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
