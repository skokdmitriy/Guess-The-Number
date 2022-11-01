//
//  ComputerGuessingNumberViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 28.09.2022.
//

import UIKit

enum NumberValid: String {
    case greater
    case less
    case equal
}

class ComputerGuessingNumberViewController: UIViewController {
    
    private lazy var computerGuessingNumber = ComputerGuessingNumberView()
    
    var game = GuessTheNumber()
    
    
    override func loadView() {
        super.loadView()
        self.view = computerGuessingNumber
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        game.computer.number = generateRandomNumber()
//        print(game.computer.number)
        print(game.player.number)
        
        setup()
        
        computerGuessingNumber.equalButton.addTarget(self, action: #selector(equalButtonPressed(_:)), for: .touchUpInside)
        computerGuessingNumber.greaterButton.addTarget(self, action: #selector(greaterButtonPressed(_:)), for: .touchUpInside)
        computerGuessingNumber.lessButton.addTarget(self, action: #selector(lessButtonPressed(_:)), for: .touchUpInside)
    }
    
    func generateRandomNumber() -> Int {
        return Int.random(in: game.minNumber...game.maxNumber)
    }
    
    func setup () {
        self.computerGuessingNumber.guessesLabel.text = "Your number is: \(game.computer.number)?"
        self.computerGuessingNumber.numberOfGuessLabel.text = "Try № \(game.computer.attemptCount)"
    }
    
    func validateComputerAnswer(answer: NumberValid) {
        if answerIsCorrect(answer: answer) {
            switch answer {
            case .greater:
                game.minNumber = game.computer.number
                game.computer.attemptCount += 1
                print(game.computer.attemptCount)
                let number = (game.minNumber + game.maxNumber) / 2
                game.computer.number = number
            case .less:
                game.maxNumber = game.computer.number
                game.computer.attemptCount += 1
                print(game.computer.attemptCount)
                let number = (game.minNumber + game.maxNumber) / 2
                game.computer.number = number
            case .equal:
                game.player.numberGuessed = true
            }
        }
    }
    
    func answerIsCorrect(answer: NumberValid) -> Bool {
        if answer == .less && game.player.number >= game.computer.number {
            errorAlert(message: "The hidden number is not less than what the computer indicated")
            return false
        } else if answer == .greater && game.player.number <= game.computer.number {
            errorAlert(message: "The hidden number is not greater than what the computer indicated")
            return false
        } else if answer == .equal && game.player.number != game.computer.number {
            errorAlert(message: "The hidden number is not equal than what the computer indicated")
            return false
        }
        return true
    }
    
    @objc private func greaterButtonPressed(_ sender: UIButton) {
        validateComputerAnswer(answer: .greater)
    }
    
    @objc private func lessButtonPressed(_ sender: UIButton) {
        validateComputerAnswer(answer: .less)

    }
    
    @objc private func equalButtonPressed(_ sender: UIButton){
        validateComputerAnswer(answer: .equal)
        if game.player.numberGuessed == true {
            playerGuessingNumber()
        }
    }
    
    func playerGuessingNumber() {
        
    }
    
    private func errorAlert(message: String) {
        let alert = AlertController(title: "Error", message: message)
        present(alert, animated: true)
    }
}
