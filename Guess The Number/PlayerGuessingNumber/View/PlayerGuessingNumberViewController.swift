//
//  PlayerGuessingNumberViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 06.11.2022.
//

import UIKit
import Combine

final class PlayerGuessingNumberViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var numberOfGuessLabel = UILabel(text: Constants.numberOfGuessText, font: .avenir26())
    private lazy var playerGuessLabel =  UILabel(text: Constants.playerGuessText, font: .avenir26())
    private lazy var resultLabel = UILabel(text: Constants.resultText, font: .avenir26())
    private lazy var numberTextField = UITextField(placeholder: Constants.numberTextPlaceholder)
    
    private lazy var guessNumberButton: UIButton = {
        let button = UIButton(title: Constants.guessNumberButtonTitle,
                              titleColor: .white,
                              backgroundColor: .systemBlue,
                              font: .avenir20())
        button.addTarget(self, action: #selector(guessTheNumberButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Private properties
    
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Public properties
    
    var viewModel = GameViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        viewModel.game.computer.number = viewModel.generateRandomNumber()
        configureLayout()
        setupBinding()
    }
    
    // MARK: - Private
    
    private func configureLayout() {
        view.addSubview(numberOfGuessLabel)
        view.addSubview(playerGuessLabel)
        view.addSubview(numberTextField)
        view.addSubview(guessNumberButton)
        view.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            numberOfGuessLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            numberOfGuessLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            numberOfGuessLabel.bottomAnchor.constraint(lessThanOrEqualTo: playerGuessLabel.topAnchor),
            
            playerGuessLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            playerGuessLabel.topAnchor.constraint(equalTo: numberOfGuessLabel.bottomAnchor, constant: 10),
            playerGuessLabel.bottomAnchor.constraint(lessThanOrEqualTo: numberTextField.topAnchor),
            
            resultLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: numberTextField.topAnchor, constant: -20),
            resultLabel.topAnchor.constraint(equalTo: playerGuessLabel.bottomAnchor, constant: 100),
            resultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            numberTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            numberTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            numberTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            numberTextField.bottomAnchor.constraint(lessThanOrEqualTo: guessNumberButton.topAnchor, constant: -40),
            
            guessNumberButton.heightAnchor.constraint(equalToConstant: 48),
            guessNumberButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            guessNumberButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 20),
            guessNumberButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            guessNumberButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
    
    private func setupBinding() {
        viewModel.$game
            .sink { game in
                self.numberOfGuessLabel.text = Constants.numberOfGuessText + String(game.player.attemptCount)
            }
            .store(in: &subscriptions)
    }
    
    private func validateResponse(response: NumberValid) {
        if response != .equal {
            resultLabel.text = "No my number is \(response.rawValue) than yours"
            numberTextField.text = ""
        } else {
            resultView()
        }
    }
    
    private func resultView() {
        let viewController = ResultGameViewController()
        viewController.viewModel = self.viewModel
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    private func showErrorAlert() {
        let alert = AlertController(title: Constants.alertTitleError , message: Constants.alertMessageError)
        present(alert, animated: true)
    }
    
    @objc func guessTheNumberButtonTapped() {
        guard let inputValue = numberTextField.text else {
            return
        }
        if let number = Int(inputValue) {
            if number >= 1 && number <= 100 {
                let result = viewModel.validatePlayerAnswer(guess: number)
                validateResponse(response: result)
            } else {
                showErrorAlert()
            }
        } else {
            showErrorAlert()
        }
    }
    
    deinit {}
}

extension PlayerGuessingNumberViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
