//
//  CalculatorVM.swift
//  tip-calculator
//
//  Created by 이명진 on 2/25/24.
//

import Foundation
import Combine

class CalculatorVM {
    
    struct Input {
        let billPublisher: AnyPublisher<Double, Never>
        let tipPublisher: AnyPublisher<Tip, Never>
        let splitPublisher: AnyPublisher<Int, Never>
    }
    
    struct Output {
        let updateViewPublisher: AnyPublisher<Result, Never>
    }
    
    func transform(input: Input) -> Output {
        
        let result = Result(
            amountPerPerson: 1000.0,
            totalBill: 500.0,
            totalTip: 150.0
        )
        return Output(
            updateViewPublisher: Just(result).eraseToAnyPublisher()
        )
    }
}
