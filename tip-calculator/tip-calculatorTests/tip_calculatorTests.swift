//
//  tip_calculatorTests.swift
//  tip-calculatorTests
//
//  Created by 이명진 on 2/23/24.
//

import XCTest
import Combine
@testable import tip_calculator

final class tip_calculatorTests: XCTestCase {
    
    private var sut: CalculatorVM!
    private var cancelBag = CancelBag()
    private let logoViewTapSubject = PassthroughSubject<Void, Never>()

    override func setUp() {
        sut = .init()
        cancelBag = .init()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testResultWithoutTipFor1Person() {
        // given
        let bill: Double = 100.0
        let tip: Tip = .none
        let split: Int = 1
        let input = bulidInput(
            bill: bill,
            tip: tip,
            split: split
        )
        // when
        let output = sut.transform(input: input)
        
        // then
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.amountPerPerson, 100)
            XCTAssertEqual(result.totalBill, 100)
            XCTAssertEqual(result.totalTip, 0)
        }.store(in: cancelBag)
    }
    
    private func bulidInput(bill: Double, tip: Tip, split: Int) -> CalculatorVM.Input {
        return .init(
            billPublisher: Just(bill).eraseToAnyPublisher(),
            tipPublisher: Just(tip).eraseToAnyPublisher(),
            splitPublisher: Just(split).eraseToAnyPublisher(),
            logoTapPublisher: logoViewTapSubject.eraseToAnyPublisher()
        )
    }
    
    

}
