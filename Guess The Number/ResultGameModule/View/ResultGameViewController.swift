//
//  ResultGameViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 08.11.2022.
//

import UIKit
import Combine

class ResultGameViewController: UIViewController {
    // MARK: - Private properties

    private lazy var resultGameView = ResultGameView()
    private let viewModel: ResultGameViewModel

    // MARK: - Lifecycle

    init(viewModel: ResultGameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Lifecycle

    override func loadView() {
        self.view = resultGameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        whoIsWinner()
    }
    
    // MARK: - Private methods

    private func setupViewController(){
        view.backgroundColor = .white
        resultGameView.goToMainMenuButton.addTarget(self, action: #selector(goToMainButtonPressed(_:)), for: .touchUpInside)
    }

    private func whoIsWinner() {
        let winner = viewModel.playerAttemptCount < viewModel.computerAttemptCount ? "You win" : "Computer win"
        resultGameView.winnerLabel.text = viewModel.playerAttemptCount == viewModel.computerAttemptCount ? "Friendship won" : winner
        resultGameView.playerTriesCountLabel.text = "Your number of attempts: \(viewModel.playerAttemptCount)"
        resultGameView.computerTriesCountLabel.text = "Computer number of attempts: \(viewModel.computerAttemptCount)"
    }
    
    @objc private func goToMainButtonPressed(_ sender: UIButton) {
        viewModel.restart()
    }
}
