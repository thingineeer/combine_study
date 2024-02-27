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
        let logoTapPublisher: AnyPublisher<Void, Never>
    }
    
    struct Output {
        let updateViewPublisher: AnyPublisher<Result, Never>
        let resetViewPublisher: AnyPublisher<Void, Never>
    }
    
    private var cancelBag = CancelBag()
    private let audioPlayerService: AudioPlayerService
    
    init(audioPlayerService: AudioPlayerService = DefaultAudioPlayer()) {
        self.audioPlayerService = audioPlayerService
    }
    
    func transform(input: Input) -> Output {
        
        let updateViewPublisher = Publishers.CombineLatest3(
            input.billPublisher,
            input.splitPublisher,
            input.tipPublisher
        ).flatMap { [unowned self] (bill, split, tip) in
            let totalTip = getTipAmount(bill: bill, tip: tip)
            let totalBill = bill + totalTip
            let amountPerPerson = totalBill / Double(split)
            
            let result = Result(
                amountPerPerson: amountPerPerson,
                totalBill: totalBill,
                totalTip: totalTip
            )
            return Just(result)
        }.eraseToAnyPublisher()
        
        let resultPublisher = input
            .logoTapPublisher
            .handleEvents(receiveOutput: { [unowned self] _ in
            audioPlayerService.playSound()
        }).flatMap {
            return Just($0)
        }.eraseToAnyPublisher()
        
        return Output(updateViewPublisher: updateViewPublisher,
                      resetViewPublisher: resultPublisher)
    }
    
    private func getTipAmount(bill: Double, tip: Tip) -> Double {
        switch  tip {
        case .none:
            return 0
        case .tenPercent:
            return bill * 0.1
        case .fifteenPercent:
            return bill * 0.15
        case .twentyPercent:
            return bill * 0.2
        case .custom(let value):
            return Double(value)
        }
    }
}
