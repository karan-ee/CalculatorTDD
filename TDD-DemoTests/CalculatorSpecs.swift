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
        XCTAssertEqual(0.666666, try calculator.divide(2,3), accuracy: 0.0000001)
        
        XCTAssertEqual(0.333333, try calculator.divide(1,3), accuracy: 0.0000001)
        XCTAssertEqual(0.500000, try calculator.divide(1,2), accuracy: 0.0000001)
    }
    
    func test_shoutsWhenDivisionByZeroOccurs() {
        //Given
        let calculator = makeCalculator()
        //When
        
        //Then
        XCTAssertThrowsError(try calculator.divide(1,0), "Cannot divide by zero"){
            XCTAssertEqual($0 as? CalculatorError, .divideByZero)
        }
        
    }
    
    func test_replaysMultiply() {
        //Given
        let calculator = makeCalculator()
        let _ = calculator.multiply(2.00, 3.00)
        //When
        let result = calculator.replay(1)
        //Then
        XCTAssertEqual("2.00 * 3.00 = 6.00", result)
    }

    func test_replaysDivide() {
        //Given
        let calculator = makeCalculator()
        _ = try? calculator.divide(9.00, 3.00)
        //When
        let result = calculator.replay(1)
        //Then
        XCTAssertEqual("9.00 / 3.00 = 3.00", result)
    }
    
    func test_replaysAddition() {
        //Given
        let calculator = makeCalculator()
        let _ = calculator.add(2.00, 3.00)
        //When
        let result = calculator.replay(1)
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
        let result = calculator.replay(2)
        //Then
       XCTAssertEqual("2.00 * 3.00 = 6.00; 2.00 + 3.00 = 5.00", result)
        
    }

    func test_nothingToReplayWhenNoOperationsPerformed() {
        //Given
        let calculator = makeCalculator()

        //Then
        XCTAssertEqual("Nothing To Replay", calculator.replay(1))
        XCTAssertEqual("Nothing To Replay", calculator.replay(2))
        XCTAssertEqual("Nothing To Replay", calculator.replay(3))
        XCTAssertEqual("Nothing To Replay", calculator.replay(4))
    }

    func test_replayTwoOperationsWhenThreePerformed() {
        //Given
        let calculator = makeCalculator()
        _ = calculator.multiply(2.00, 3.00)
        _ = calculator.add(2.00, 3.00)
        _ = try? calculator.divide(9.00, 3.00)

        //When
        let result = calculator.replay(2)

        //Then
        XCTAssertEqual("2.00 * 3.00 = 6.00; 2.00 + 3.00 = 5.00", result)
    }
    
    func test_replayEmptyWhenInvalidInputs() {
        //Given
        let calculator = makeCalculator()

        //Then
        XCTAssertEqual("", calculator.replay(0))
        XCTAssertEqual("", calculator.replay(-1))
    }

    func test_replayAllOperations() {
        //Given
        let calculator = makeCalculator()
        _ = calculator.multiply(2.00, 3.00)
        _ = calculator.add(2.00, 3.00)

        //Then
        XCTAssertEqual("2.00 * 3.00 = 6.00; 2.00 + 3.00 = 5.00", calculator.replay(3))
        XCTAssertEqual("2.00 * 3.00 = 6.00; 2.00 + 3.00 = 5.00", calculator.replay(4))
        XCTAssertEqual("2.00 * 3.00 = 6.00; 2.00 + 3.00 = 5.00", calculator.replay(5))
        XCTAssertEqual("2.00 * 3.00 = 6.00; 2.00 + 3.00 = 5.00", calculator.replay(6))
    }
    
    private func makeCalculator() -> Calculator {
        return Calculator()
    }
}
