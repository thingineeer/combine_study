//
//  TipInputView.swift
//  tip-calculator
//
//  Created by 이명진 on 2/25/24.
//

import UIKit

class TipInputView: UIView {
    
    private let headerView: HeaderView = {
        let view = HeaderView()
        view.configure(topText: "Choose", bottomText: "your Tip")
        return view
    }()
    
    private lazy var tenPercentTipButton: UIButton = {
        let button = bulidTipButton(tip: .tenPercent)
        return button
    }()
    
    private lazy var fiftenPercentTipButton: UIButton = {
        let button = bulidTipButton(tip: .fiftenPercent)
        return button
    }()
    
    private lazy var twentyPercentTipButton: UIButton = {
        let button = bulidTipButton(tip: .twnetyPercent)
        return button
    }()
    
    private lazy var customTipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Custom tip", for: .normal)
        button.titleLabel?.font = ThemeFont.bold(ofSize: 20)
        button.backgroundColor = ThemeColor.primary
        button.tintColor = .white
        button.addCornerRadius(radius: 8.0)
        return button
    }()
    
    private lazy var buttonHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            tenPercentTipButton,
            fiftenPercentTipButton,
            twentyPercentTipButton])
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var buttonVStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            buttonHStackView,
            customTipButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
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
        addSubviews(headerView, buttonVStackView)
        
        headerView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(buttonVStackView.snp.leading).offset(-24)
            $0.width.equalTo(68)
            $0.centerY.equalTo(buttonHStackView.snp.centerY)
        }
        
        buttonVStackView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    private func bulidTipButton(tip: Tip) -> UIButton {
        let button = UIButton(type: .custom)
        button.backgroundColor = ThemeColor.primary
        button.addCornerRadius(radius: 8.0)
        let text = NSMutableAttributedString(
            string: tip.stringValue,
            attributes: [.font: ThemeFont.bold(ofSize: 20),
                         .foregroundColor: UIColor.white]
        )
        text.addAttributes(
            [.font: ThemeFont.demiBold(ofSize: 14)],
            range: NSMakeRange(2, 1))
        button.setAttributedTitle(text, for: .normal)
        
        return button
    }
}
