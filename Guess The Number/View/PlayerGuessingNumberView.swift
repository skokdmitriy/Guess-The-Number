//
//  PlayerGuessingNumberView.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 06.11.2022.
//

import UIKit

class PlayerGuessingNumberView: UIView {
    
    let numberOfGuessLabel = UILabel(text: "Try №", font: .avenir26())
    let playerGuessLabel =  UILabel(text: "You are guessing", font: .avenir26())
    let resultLabel = UILabel(text: "Enter number", font: .avenir26())
    let numberTextField = UITextField(placeholder: "Enter")
    let guessNumberButton = UIButton(title: "Guess", titleColor: .white, backgroundColor: .systemBlue, font: .avenir20())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(numberOfGuessLabel)
        addSubview(playerGuessLabel)
        addSubview(numberTextField)
        addSubview(guessNumberButton)
        addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            numberOfGuessLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            numberOfGuessLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            numberOfGuessLabel.bottomAnchor.constraint(lessThanOrEqualTo: playerGuessLabel.topAnchor),

            playerGuessLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            playerGuessLabel.topAnchor.constraint(equalTo: numberOfGuessLabel.bottomAnchor, constant: 10),
            playerGuessLabel.bottomAnchor.constraint(lessThanOrEqualTo: numberTextField.topAnchor),
            
            resultLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: numberTextField.topAnchor, constant: -20),
            resultLabel.topAnchor.constraint(equalTo: playerGuessLabel.bottomAnchor, constant: 100),
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
    
    private func setupConstraints() {
    
    }

}


