//
//  ComputerGuessingNumberView.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 27.09.2022.
//

import UIKit

class ComputerGuessingNumberView: UIView {
    
    //    MARK: - Subviews
    
    lazy var numberOfGuessLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 1
        label.text = "Try №"
        return label
    }()
    
    private lazy var computerGuessesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 1
        label.text = "Computer is guessing"
        return label
    }()
    
    lazy var guessesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 1
        label.text = "Your number is: "
        return label
    }()
    
    private lazy var numberIsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 1
        label.text = "My number is ..."
        return label
    }()
    
    lazy var greaterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.setImage(UIImage(systemName: "greaterthan"), for: .normal)
        return button
    }()
    
    lazy var equalButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.setImage(UIImage(systemName: "equal"), for: .normal)
        return button
    }()
    
    lazy var lessButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.setImage(UIImage(systemName: "lessthan"), for: .normal)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        stackView.addArrangedSubview(greaterButton)
        stackView.addArrangedSubview(equalButton)
        stackView.addArrangedSubview(lessButton)

        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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


