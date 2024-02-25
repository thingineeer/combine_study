//
//  SplitInputView.swift
//  tip-calculator
//
//  Created by 이명진 on 2/25/24.
//

import UIKit

class SplitInputView: UIView {
    
    private let headerView: HeaderView = {
        let view = HeaderView()
        view.configure(topText: "Split", bottomText: "the total")
        return view
    }()
    
    private lazy var decrmentButton: UIButton = {
        let button = buildButton(
            text: "-",
            corners: [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        )
        return button
    }()
    
    private lazy var incrmentButton: UIButton = {
        let button = buildButton(
            text: "+",
            corners: [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        )
        return button
    }()
    
    private lazy var quantityLabel: UILabel = {
        let label = LabelFactory.build(
            text: "1",
            font: ThemeFont.bold(ofSize: 20),
            backgroundColor: .white
        )
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            decrmentButton,
            quantityLabel,
            incrmentButton
        ])
        stackView.axis = .horizontal
        stackView.spacing = 0
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
        addSubviews(headerView, stackView)
        
        stackView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
        }
        
        [incrmentButton, decrmentButton].forEach { button in
            button.snp.makeConstraints {
                $0.width.equalTo(button.snp.height)
            }
        }
        
        headerView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalTo(stackView.snp.centerY)
            $0.trailing.equalTo(stackView.snp.leading).offset(-24)
            $0.width.equalTo(68)
        }
        
    }
    
    private func buildButton(text: String, corners: CACornerMask) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = ThemeFont.bold(ofSize: 20)
        button.addRounderCorners(corners: corners, radius: 8.0)
        button.backgroundColor = ThemeColor.primary
        return button
    }
}
