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
    
    private var cancelBag = CancelBag()
    
    
    func transform(input: Input) -> Output {
        
        input.tipPublisher.sink { tip in
            print(tip)
        }.store(in: cancelBag)
        
        input.splitPublisher.sink { value in
            print(value)
        }.store(in: cancelBag)
        
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
