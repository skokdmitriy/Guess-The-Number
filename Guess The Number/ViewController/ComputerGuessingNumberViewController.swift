//
//  ComputerGuessingNumberViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 28.09.2022.
//

import UIKit
import Combine

class ComputerGuessingNumberViewController: UIViewController {
    
    private lazy var computerGuessingNumber = ComputerGuessingNumberView()
    private var subscriptions = Set<AnyCancellable>()
    
    var viewModel = GameViewModel()
    
    override func loadView() {
        super.loadView()
        self.view = computerGuessingNumber
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        viewModel.game.computer.number = viewModel.generateRandomNumber()
        
        setup()
        
        computerGuessingNumber.equalButton.addTarget(self, action: #selector(equalButtonPressed(_:)), for: .touchUpInside)
        computerGuessingNumber.greaterButton.addTarget(self, action: #selector(greaterButtonPressed(_:)), for: .touchUpInside)
        computerGuessingNumber.lessButton.addTarget(self, action: #selector(lessButtonPressed(_:)), for: .touchUpInside)
    }

    func setup () {
        viewModel.$error
            .sink { error in
                DispatchQueue.main.async {
                    guard let errorDescription = self.viewModel.error else { return }
                    let alertController = self.getGameAlert(title: "Tricky bug", message: errorDescription)
                    self.present(alertController, animated: true)
                }
            }
            .store(in: &subscriptions)
        
        viewModel.$game
            .sink { game in
                self.computerGuessingNumber.guessesLabel.text = "Your number is: \(game.computer.number)?"
                self.computerGuessingNumber.numberOfGuessLabel.text = "Try №\(game.computer.attemptCount)"
            }
            .store(in: &subscriptions)
    }
                   

    @objc private func greaterButtonPressed(_ sender: UIButton) {
            viewModel.validateComputerAnswer(answer: .greater)
    }
    
    @objc private func lessButtonPressed(_ sender: UIButton) {
            viewModel.validateComputerAnswer(answer: .less)
    }
    
    @objc private func equalButtonPressed(_ sender: UIButton){
            viewModel.validateComputerAnswer(answer: .equal)
        if viewModel.game.player.numberGuessed == true {
            playerGuessingNumber()
        }
    }
    
    func playerGuessingNumber() {
        let viewController = PlayerGuessingNumberViewController()
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .coverVertical
        present(viewController, animated: true)
    }
    
    func getGameAlert(title: String, message: String?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(actionOK)
        return alert
    }
}
