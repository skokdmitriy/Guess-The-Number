//
//  ComputerGuessingNumberView.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 27.09.2022.
//

import UIKit

final class ComputerGuessingNumberView: UIView {
    // MARK: - Views

    lazy var numberOfGuessLabel: UILabel = {
        let label = UILabel()
        label.text = "Try №"
        label.font = .avenir26()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var computerGuessesLabel: UILabel = {
        let label = UILabel()
        label.text = "Computer is guessing"
        label.font = .avenir26()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var guessesLabel: UILabel = {
        let label = UILabel()
        label.text = "Your number is: "
        label.font = .avenir26()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var numberIsLabel: UILabel = {
        let label = UILabel()
        label.text = "My number is ..."
        label.font = .avenir26()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var greaterButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.setImage(UIImage(systemName: "greaterthan"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var equalButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.setImage(UIImage(systemName: "equal"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var lessButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.setImage(UIImage(systemName: "lessthan"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.addArrangedSubview(greaterButton)
        stackView.addArrangedSubview(equalButton)
        stackView.addArrangedSubview(lessButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        addSubview(numberOfGuessLabel)
        addSubview(computerGuessesLabel)
        addSubview(guessesLabel)
        addSubview(numberIsLabel)
        addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            numberOfGuessLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            numberOfGuessLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            numberOfGuessLabel.bottomAnchor.constraint(lessThanOrEqualTo: computerGuessesLabel.topAnchor),
            
            computerGuessesLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            computerGuessesLabel.topAnchor.constraint(equalTo: numberOfGuessLabel.bottomAnchor, constant: 10),
            computerGuessesLabel.bottomAnchor.constraint(lessThanOrEqualTo: guessesLabel.topAnchor),
            
            guessesLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            guessesLabel.topAnchor.constraint(equalTo: computerGuessesLabel.bottomAnchor, constant: 100),
            guessesLabel.bottomAnchor.constraint(lessThanOrEqualTo: numberIsLabel.topAnchor),
            
            numberIsLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            numberIsLabel.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor),
            numberIsLabel.bottomAnchor.constraint(lessThanOrEqualTo: buttonStackView.topAnchor, constant: -10),
            
            buttonStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            
            greaterButton.heightAnchor.constraint(equalToConstant: 50),
            greaterButton.widthAnchor.constraint(equalToConstant: 50),
            
            equalButton.heightAnchor.constraint(equalToConstant: 50),
            equalButton.widthAnchor.constraint(equalToConstant: 50),

            lessButton.heightAnchor.constraint(equalToConstant: 50),
            lessButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}


