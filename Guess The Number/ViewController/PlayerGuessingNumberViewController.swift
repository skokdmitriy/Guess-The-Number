//
//  PlayerGuessingNumberViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 06.11.2022.
//

import UIKit
import Combine

class PlayerGuessingNumberViewController: UIViewController {
    
    private lazy var playerGuessingNumberView = PlayerGuessingNumberView()
    private var subscriptions = Set<AnyCancellable>()
    var viewModel = GameViewModel()
    
    override func loadView() {
        self.view = playerGuessingNumberView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.game.computer.number = viewModel.generateRandomNumber()
        print (viewModel.game.computer.number)
        setup()
        
        playerGuessingNumberView.guessNumberButton.addTarget(self, action: #selector(guessTheNumberButtonPressed(_:)), for: .touchUpInside)
    }
    
    private func setup() {
        viewModel.$game
            .sink { game in
                self.playerGuessingNumberView.numberOfGuessLabel.text = "Try №\(game.player.attemptCount)"
            }
            .store(in: &subscriptions)
    }
    
    private func validateResponse(response: NumberValid) {
        if response != .equal {
            playerGuessingNumberView.resultLabel.text = "No my number is \(response.rawValue) than yours"
            playerGuessingNumberView.numberTextField.text = ""
        } else {
            resultView()
        }
    }
    
    @objc func guessTheNumberButtonPressed(_ sender: UIButton) {
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
    
    
    // MARK: - Navigation
   private func resultView() {
       let viewController = ResultGameViewController()
       viewController.viewModel = self.viewModel
       viewController.modalPresentationStyle = .fullScreen
       
       self.present(viewController, animated: true)
    }
    
    private func showErrorAlert() {
        let alert = AlertController(title: "Error", message: "Please enter a number from 1 to 100")
        present(alert, animated: true)
    }
    
    deinit {
        print("deallocated")
    }
}

extension PlayerGuessingNumberViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
