//
//  PlayerGuessingNumberViewModel.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 19.11.2023.
//

import Foundation
import Combine

final class PlayerGuessingNumberViewModel {
    // MARK: - Properties

    @Published var player = Guesser()
    var isComputerNumberGuessed = false

    // MARK: - Private properties

    private let router: PlayerGuessingNumberRouter
    private var game = GuessTheNumber()
    private var computerNumber = 0
    private let computerAttemptCount: Int

    // MARK: - Initialization

    init(router: PlayerGuessingNumberRouter, computerAttemptCount: Int) {
        self.router = router
        self.computerAttemptCount = computerAttemptCount
        generateComputerNumber()
    }

    // MARK: - Functions

    private func generateComputerNumber() {
        computerNumber = Int.random(in: game.minNumber...game.maxNumber)
    }

    func validatePlayerAnswer(guess: Int) -> NumberValid {
        if computerNumber < guess {
            player.attemptCount += 1
            return .less
        } else if computerNumber > guess {
            player.attemptCount += 1
            return .greater
        } else {
            isComputerNumberGuessed = true
            return .equal
        }
    }

    func correctNumber() {
        router.showResultGame(playerAttemptCount: player.attemptCount, computerAttemptCount: computerAttemptCount)
    }
}
