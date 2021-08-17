//
//  Memory.swift
//  TDD-Demo
//
//  Created by Karan Gavali on 16/08/21.
//  Copyright © 2021 Brajesh Kumar. All rights reserved.
//

import Foundation

class Memory {
    private var memory = [String]()

    func add(x:Double, operation: String, y: Double, result: Double) {
        let result = "\(x.format()) \(operation) \(y.format()) = \(result.format())"
        memory.append(result)
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
}

extension Double {
    func format() -> String {
        return String(format: "%.2f", self)
    }
}
