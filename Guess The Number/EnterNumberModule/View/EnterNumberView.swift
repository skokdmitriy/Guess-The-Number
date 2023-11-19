//
//  EnterNumberView.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 26.09.2022.
//

import UIKit

final class EnterNumberView: UIView {
    // MARK: - Views

    lazy var numberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Guess the number"
        textField.font = .avenir20()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var enterNumberButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.configuration?.cornerStyle = .capsule
        button.setTitle("Enter the Number", for: .normal)
        button.titleLabel?.font = .avenir20()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions

    private func setupLayout() {
        addSubview(numberTextField)
        addSubview(enterNumberButton)
        
        NSLayoutConstraint.activate([
            numberTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            numberTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            numberTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            numberTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            enterNumberButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            enterNumberButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            enterNumberButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            enterNumberButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            enterNumberButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
