//
//  EnterNumberView.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 26.09.2022.
//

import UIKit

class EnterNumberView: UIView {
    
    //    MARK: - Subviews
    
    private(set) lazy var numberTextField: UITextField = {
        let textField = UITextField ()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Guess the number"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.returnKeyType = .done
        textField.textAlignment = .center
        return textField
    }()
    
    private(set) lazy var enterNumberButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Enter the Number", for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 15.0
        return button
    }()
    
    //    MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - UI
    
    private func setupLayout() {
        addSubview(numberTextField)
        addSubview(enterNumberButton)
        
        NSLayoutConstraint.activate([
            numberTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            numberTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            enterNumberButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            enterNumberButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            enterNumberButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            enterNumberButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            enterNumberButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
