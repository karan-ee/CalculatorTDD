//
//  CalculatorSpecs.swift
//  TDD-DemoTests
//
//  Created by Brajesh Kumar on 04/08/21.
//  Copyright © 2021 Brajesh Kumar. All rights reserved.
//

import XCTest
@testable import TDD_Demo

class CalculatorSpecs: XCTestCase {
    
    func test_addTwoNumbers()  {
        //Given
        let calculator = makeCalculator()
        //When
        print("addTwoNumber")
        //Then
        XCTAssertEqual(5, calculator.add(2,3))
        XCTAssertEqual(6.0, calculator.add(3.0,3.0))
    }
    
    func test_multiplyTwoNumbers()  {
        //Given
        let calculator = makeCalculator()
        //When
        
        //Then
        XCTAssertEqual(6, calculator.multiply(2,3))
        XCTAssertEqual(9.0, calculator.multiply(3.0,3.0))
    }
    
    func test_divideTwoNumbersWithSixDigitsPrecision() {
        //Given
        let calculator = makeCalculator()
        //When
        
        //Then
        XCTAssertEqual(0.666666, try calculator.divide(x:2,y:3), accuracy: 0.0000001)
        
        XCTAssertEqual(0.333333, try calculator.divide(x:1,y:3), accuracy: 0.0000001)
        XCTAssertEqual(0.500000, try calculator.divide(x:1,y:2), accuracy: 0.0000001)
    }
    
    func test_shoutsWhenDivisionByZeroOccurs() {
        //Given
        let calculator = makeCalculator()
        //When
        
        //Then
        XCTAssertThrowsError(try calculator.divide(x:1,y:0), "Cannot divide by zero"){
            XCTAssertEqual($0 as? CalculatorError, .divideByZero)
        }
        
    }
    
    func test_replaysMultiply() {
        //Given
        let calculator = makeCalculator()
        let _ = calculator.multiply(2.00, 3.00)
        //When
        let result = calculator.replay()
        //Then
        XCTAssertEqual("2.00 * 3.00 = 6.00", result)
    }
    
    func test_replaysAddition() {
        //Given
        let calculator = makeCalculator()
        let _ = calculator.add(2.00, 3.00)
        //When
        let result = calculator.replay()
        //Then
        XCTAssertEqual("2.00 + 3.00 = 5.00", result)
    }
    //ToDo: Add division and substraction specs
    
    func test_replaysMultiplyAndAdd() {
        //Given
        let calculator = makeCalculator()
        let _ = calculator.multiply(2.00, 3.00)
        let _ = calculator.add(2.00, 3.00)
        //When
        let result = calculator.replay()
        //Then
       XCTAssertEqual("2.00 * 3.00 = 6.00; 2.00 + 3.00 = 5.00", result)
        
    }
    
    private func makeCalculator() -> Calculator {
        return Calculator()
    }
}
