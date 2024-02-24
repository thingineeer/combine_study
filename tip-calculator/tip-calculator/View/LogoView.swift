//
//  LogoView.swift
//  tip-calculator
//
//  Created by 이명진 on 2/25/24.
//

import UIKit

class LogoView: UIView {
    
    init() {
        super.init(frame: .zero)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setLayout() {
        backgroundColor = .red
    }
}
