//
//  LogoView.swift
//  tip-calculator
//
//  Created by 이명진 on 2/25/24.
//

import UIKit

class LogoView: UIView {
    
    private let imageView: UIImageView = {
        let view = UIImageView(image: .icCalculatorBW)
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: "Mr Tip",
            attributes: [.font: ThemeFont.demiBold(ofSize: 16)])
        text.addAttributes([.font: ThemeFont.bold(ofSize: 24)], range: NSMakeRange(3, 3))
        label.attributedText = text
        return label
    }()
    
    private let bottomLabel: UILabel = {
        LabelFactory.build(
            text: "Calculator",
            font: ThemeFont.demiBold(ofSize: 20),
            textAlignment: .left
        )
    }()
    
    private lazy var vStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            topLabel,
            bottomLabel
        ])
        view.axis = .vertical
        view.spacing = -4
        return view
    }()
    
    
    private lazy var hStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            imageView, vStackView
        ])
        
        view.axis = .horizontal
        view.spacing = 8
        view.alignment = .center
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setLayout() {
        addSubview(hStackView)
        hStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.height.equalTo(imageView.snp.width)
        }
    }
}
