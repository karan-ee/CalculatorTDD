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
    
    private func makeCalculator() -> Calculator {
       return Calculator()
    }
}
