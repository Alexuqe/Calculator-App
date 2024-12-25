//
//  ClaculatorManager.swift
//  Calculator App (TeachMeSkillsHomeWork)
//
//  Created by Sasha on 25.12.24.
//

import Foundation

final class CalculatorManager {

    static let shared = CalculatorManager()

    private(set) var currentNumber: String = "0"
    private(set) var previousNumber: String = ""
    private(set) var currentOperation: Operations?
    private(set) var displayOperation: String = ""
    private var shouldResetNumber = false

    private init() {}

    func reset() {
        currentNumber = "0"
        previousNumber = ""
        currentOperation = nil
        displayOperation = ""
        shouldResetNumber = false
    }

    func inputNumber(_ number: String) {
        if shouldResetNumber {
            currentNumber = number
            shouldResetNumber = false
        } else {
            if currentNumber == "0" {
                currentNumber = number
            } else {
                currentNumber += number
            }
        }
    }

    func inputDecimal() {
        if !currentNumber.contains(".") {
            currentNumber += "."
        }
    }

    func setOperation(_ operation: Operations) {
        previousNumber = currentNumber
        currentOperation = operation
        displayOperation = operation.symbol?.description ?? ""
        shouldResetNumber = true
    }

    func calculateResult() {
        guard let operation = currentOperation,
            let number1 = Double(previousNumber),
            let number2 = Double(currentNumber)
        else {
            return
        }

        var result: Double = 0

        switch operation {
        case .plus:
            result = number1 + number2
        case .minus:
            result = number1 - number2
        case .multiple:
            result = number1 * number2
        case .separation:
            if number2 != 0 {
                result = number1 / number2
            } else {
                currentNumber = "Error"
                return
            }
        case .percent:
            result = number1 * (number2 / 100)
        case .toggle:
            currentNumber = String(-Int(currentNumber)!)
            return

        case .canceled:
            reset()
            return
        }

        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        currentNumber = formatter.string(from: NSNumber(value: result)) ?? String(result)
        currentOperation = nil
    }

    func toggleSign() {
        if let value = Double(currentNumber) {
            currentNumber = String(-value)
        }
    }
}

enum Operations {
    case plus
    case minus
    case separation
    case percent
    case multiple
    case toggle
    case canceled

    var symbol: Character? {
        switch self {
        case .plus: return "+"
        case .minus: return "-"
        case .separation: return "÷"
        case .percent: return "%"
        case .multiple: return "×"
        default: return nil
        }
    }
}
