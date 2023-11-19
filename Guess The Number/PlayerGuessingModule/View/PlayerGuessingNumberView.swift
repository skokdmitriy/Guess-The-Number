//
//  PlayerGuessingNumberView.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 06.11.2022.
//

import UIKit

class PlayerGuessingNumberView: UIView {
    // MARK: - Views

    lazy var numberOfGuessLabel: UILabel = {
        let label = UILabel()
        label.text = "Try №"
        label.font = .avenir26()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var playerGuessLabel: UILabel = {
        let label = UILabel()
        label.text = "You are guessing"
        label.font = .avenir26()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter number"
        label.font = .avenir26()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var numberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter"
        textField.font = .avenir20()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var guessNumberButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.configuration?.cornerStyle = .capsule
        button.setTitle("Guess", for: .normal)
        button.titleLabel?.font = .avenir20()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions

    private func setupView() {
        addSubview(numberOfGuessLabel)
        addSubview(playerGuessLabel)
        addSubview(resultLabel)
        addSubview(numberTextField)
        addSubview(guessNumberButton)
        
        NSLayoutConstraint.activate([
            numberOfGuessLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            numberOfGuessLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            numberOfGuessLabel.bottomAnchor.constraint(lessThanOrEqualTo: playerGuessLabel.topAnchor),
            
            playerGuessLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            playerGuessLabel.topAnchor.constraint(equalTo: numberOfGuessLabel.bottomAnchor, constant: 10),
            playerGuessLabel.bottomAnchor.constraint(lessThanOrEqualTo: numberTextField.topAnchor),
            
            resultLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: numberTextField.topAnchor, constant: -20),
            resultLabel.topAnchor.constraint(greaterThanOrEqualTo: playerGuessLabel.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            numberTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            numberTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            numberTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            numberTextField.bottomAnchor.constraint(lessThanOrEqualTo: guessNumberButton.topAnchor, constant: -40),
            
            guessNumberButton.heightAnchor.constraint(equalToConstant: 48),
            guessNumberButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            guessNumberButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 20),
            guessNumberButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            guessNumberButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
}
