//
//  MemorySpecs.swift
//  TDD-DemoTests
//
//  Created by Karan Gavali on 16/08/21.
//  Copyright © 2021 Brajesh Kumar. All rights reserved.
//

import XCTest
@testable import TDD_Demo

class MemorySpecs: XCTestCase {
    func test_emptyMemoryReplaysNothing() {
        //Given
        let memory = makeMemory()

        //Then
        XCTAssertEqual(memory.replay(1), "Nothing To Replay")
        XCTAssertEqual(memory.replay(2), "Nothing To Replay")
        XCTAssertEqual(memory.replay(3), "Nothing To Replay")
    }

    func test_replayEmptyWhenInvalidInputs() {
        //Given
        let memory = makeMemory()

        //Then
        XCTAssertEqual(memory.replay(0), "")
        XCTAssertEqual(memory.replay(-1), "")
    }

    func test_replayOneOperationWhenOnePerformed() {
        //Given
        let memory = makeMemory()

        //When
        memory.add(x: 2, operation: "*", y: 4, result: 8)
        
        //Then
        XCTAssertEqual(memory.replay(1), "2.00 * 4.00 = 8.00")
    }

    func test_replayOneOperationWhenTwoPerformed() {
        //Given
        let memory = makeMemory()

        //When
        memory.add(x: 3, operation: "+", y: 2, result: 5)
        memory.add(x: 2, operation: "*", y: 4, result: 8)
        
        //Then
        XCTAssertEqual(memory.replay(1), "3.00 + 2.00 = 5.00")
    }

    private func makeMemory() -> Memory {
        return Memory()
    }
}
