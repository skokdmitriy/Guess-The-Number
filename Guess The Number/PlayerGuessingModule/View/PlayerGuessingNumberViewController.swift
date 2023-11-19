//
//  PlayerGuessingNumberViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 06.11.2022.
//

import UIKit
import Combine

class PlayerGuessingNumberViewController: UIViewController {
    // MARK: - Private properties

    private lazy var playerGuessingNumberView = PlayerGuessingNumberView()
    private var subscriptions = Set<AnyCancellable>()
    private let viewModel: PlayerGuessingNumberViewModel

    // MARK: - Initialization

    init(viewModel: PlayerGuessingNumberViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        
        self.view = playerGuessingNumberView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewController()
        binding()
    }
    
    // MARK: - Private methods

    private func setupViewController() {
        view.backgroundColor = .white
        playerGuessingNumberView.guessNumberButton.addTarget(self, action: #selector(guessTheNumberButtonPressed(_:)), for: .touchUpInside)
    }

    private func binding() {
        viewModel.$player
            .sink { player in
                self.playerGuessingNumberView.numberOfGuessLabel.text = "Try №\(player.attemptCount)"
            }
            .store(in: &subscriptions)
    }
    
    private func validateResponse(response: NumberValid) {
        if response != .equal {
            playerGuessingNumberView.resultLabel.text = "No my number is \(response.rawValue) than yours"
            playerGuessingNumberView.numberTextField.text = ""
        } else {
            viewModel.correctNumber()
        }
    }
    
    @objc private func guessTheNumberButtonPressed(_ sender: UIButton) {
        guard let inputValue = playerGuessingNumberView.numberTextField.text else { return }
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

    
    private func showErrorAlert() {
        let alert = AlertController(title: "Error",
                                    message: "Please enter a number from 1 to 100"
        )
        present(alert, animated: true)
    }
}

// MARK: - Extension

extension PlayerGuessingNumberViewController {

    /// Closing keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
