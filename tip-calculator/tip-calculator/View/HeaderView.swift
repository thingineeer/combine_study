//
//  HeaderView.swift
//  tip-calculator
//
//  Created by 이명진 on 2/25/24.
//

import UIKit

class HeaderView: UIView {
    
    private let topLabel: UILabel = {
        LabelFactory.build(
            text: nil,
            font: ThemeFont.bold(
                ofSize: 18
            )
        )
    }()
    
    private let bottomLabel: UILabel = {
        LabelFactory.build(
            text: nil,
            font: ThemeFont.regular(
                ofSize: 16
            )
        )
    }()
    
    private let topSpacerView = UIView()
    private let bottomSpacerView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            topSpacerView,
            topLabel,
            bottomLabel,
            bottomSpacerView
        ])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = -4
        return stackView
    }()
    
    
    init() {
        super.init(frame: .zero)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        topSpacerView.snp.makeConstraints {
            $0.height.equalTo(bottomSpacerView)
        }
    }
    
    func configure(topText: String, bottomText: String) {
        topLabel.text = topText
        bottomLabel.text = bottomText
    }
}

