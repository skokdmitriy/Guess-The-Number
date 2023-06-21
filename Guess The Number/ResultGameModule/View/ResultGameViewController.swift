//
//  ResultGameViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 08.11.2022.
//

import UIKit

final class ResultGameViewController: UIViewController {

    // MARK: - Subviews

    private lazy var scoresLabel = UILabel(text: Constants.scoreLabelText, font: .avenir26())
    private lazy var playerTriesCountLabel = UILabel(text: Constants.playerTriesCountText, font: .avenir26())
    private lazy var computerTriesCountLabel = UILabel(text: Constants.computerTriesCountText, font: .avenir26())
    private lazy var winnerLabel = UILabel(text: Constants.winText, font: .avenir26())

    private lazy var goToMainMenuButton: UIButton = {
        let button = UIButton(title: Constants.goToMainMenuButtonTitle,
                              titleColor: .white,
                              backgroundColor: .systemBlue,
                              font: .avenir20()
        )
        button.addTarget(self, action: #selector(goToMainButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Public properties

    var viewModel = GameViewModel()

    // MARK: - Livecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureLayout()
        whoIsWinner()
    }

    // MARK: - Private

    private func configureLayout() {
        view.addSubview(scoresLabel)
        view.addSubview(playerTriesCountLabel)
        view.addSubview(computerTriesCountLabel)
        view.addSubview(winnerLabel)
        view.addSubview(goToMainMenuButton)

        NSLayoutConstraint.activate([
            scoresLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            scoresLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            scoresLabel.bottomAnchor.constraint(lessThanOrEqualTo: playerTriesCountLabel.topAnchor),

            playerTriesCountLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            playerTriesCountLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            playerTriesCountLabel.bottomAnchor.constraint(lessThanOrEqualTo: computerTriesCountLabel.topAnchor, constant: -20),

            computerTriesCountLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            computerTriesCountLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            computerTriesCountLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            computerTriesCountLabel.bottomAnchor.constraint(lessThanOrEqualTo: winnerLabel.topAnchor),

            winnerLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            winnerLabel.bottomAnchor.constraint(lessThanOrEqualTo: goToMainMenuButton.topAnchor, constant: -50),

            goToMainMenuButton.heightAnchor.constraint(equalToConstant: 48),
            goToMainMenuButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            goToMainMenuButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            goToMainMenuButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            goToMainMenuButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }

    private func whoIsWinner() {
        let playerAttemptCount = viewModel.game.player.attemptCount
        let computerAttemptCount = viewModel.game.computer.attemptCount
        let winner = playerAttemptCount < computerAttemptCount ? Constants.youWin : Constants.computerWin
        playerTriesCountLabel.text = "Your number of attempts: \(playerAttemptCount)"
        computerTriesCountLabel.text = "Computer number of attempts: \(computerAttemptCount)"
        winnerLabel.text = playerAttemptCount == computerAttemptCount ? Constants.friendshipWon : winner
    }

    @objc private func goToMainButtonTapped() {
        goToStart()
    }

    private func goToStart() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }

    deinit {}
}
