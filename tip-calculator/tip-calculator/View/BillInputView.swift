//
//  BillInputView.swift
//  tip-calculator
//
//  Created by 이명진 on 2/25/24.
//

import UIKit

class BillInputView: UIView {
    
    init() {
        super.init(frame: .zero)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setLayout() {
        backgroundColor = .green
    }
}
