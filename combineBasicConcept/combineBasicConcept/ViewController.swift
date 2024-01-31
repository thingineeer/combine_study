//
//  ViewController.swift
//  combineBasicConcept
//
//  Created by 이명진 on 1/30/24.
//

import UIKit
import SnapKit
import Combine

class ViewController: UIViewController {
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀 번호"
        textField.font = .boldSystemFont(ofSize: 30.0)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordCheckTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀 번호 확인"
        textField.font = .boldSystemFont(ofSize: 30.0)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let checkButton: UIButton = {
        let button = UIButton()
        button.setTitle("내 버튼", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private var cancelBag = Set<AnyCancellable>()
    
    var viewModel: MyViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setBind()
        
    }
    
    
    private func setUI() {
        view.addSubview(textStackView)
        
        textStackView.addArrangedSubview(passwordTextField)
        textStackView.addArrangedSubview(passwordCheckTextField)
        textStackView.addArrangedSubview(checkButton)
        
        // Set up constraints for the stack view
        textStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
    }
    
    private func setBind() {
        viewModel = MyViewModel()
        
        passwordTextField
            .myTextPublisher
            .receive(on: DispatchQueue.main) /// 스레드 - 메인
            .assign(to: \.passwordInput, on: viewModel) /// 구독
            .store(in: &cancelBag)
        
        passwordCheckTextField
            .myTextPublisher
            .print()
            .receive(on: DispatchQueue.main) /// 스레드 - 메인
            .assign(to: \.passwordConfirm, on: viewModel) /// 구독
            .store(in: &cancelBag)
    }
    
}

extension UITextField {
    
    var myTextPublisher: AnyPublisher<String, Never> {
        
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField } /// compactMap으로 UITextField 로 캐스팅
            .map { $0.text ?? "text"} /// 거기서 text -  String 을 가져온다
            .eraseToAnyPublisher()
        
    }
    
    
}

