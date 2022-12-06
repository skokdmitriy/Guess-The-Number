//
//  ResultGameViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 08.11.2022.
//

import UIKit

class ResultGameViewController: UIViewController {
    
    private lazy var resultGameView = ResultGameView()
    
    var viewModel = GameViewModel()
    
    override func loadView() {
        self.view = resultGameView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        whoIsWinner()
        
        resultGameView.goToMainMenuButton.addTarget(self, action: #selector(goToMainButtonPressed(_:)), for: .touchUpInside)

    }
    
    private func whoIsWinner() {
        let playerAttemptCount = viewModel.game.player.attemptCount
        let computerAttemptCount = viewModel.game.computer.attemptCount
        let winner = playerAttemptCount < computerAttemptCount ? "You win" : "Computer win"
        resultGameView.playerTriesCountLabel.text = "Your number of attempts: \(playerAttemptCount)"
        resultGameView.computerTriesCountLabel.text = "Computer number of attempts: \(computerAttemptCount)"
        resultGameView.winnerLabel.text = playerAttemptCount == computerAttemptCount ? "Friendship won" : winner
    }
    
    @objc private func goToMainButtonPressed(_ sender: UIButton) {
        goToStart()
    }
    
    // MARK: - Navigation
    private func goToStart() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("deallocated")
    }


}
