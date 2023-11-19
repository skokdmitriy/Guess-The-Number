//
//  ComputerGuessingNumberViewModel.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 19.11.2023.
//

import Foundation
import Combine

final class ComputerGuessingNumberViewModel {
    // MARK: - Properties

    @Published var computer = Guesser()
    @Published var error: String?
    var isPlayerNumberGuesser: Bool = false

    // MARK: - Private properties

    private var game = GuessTheNumber()
    private let playerNumber: Int
    private let router: ComputerGuessingNumberRouter

    // MARK: - Initialization

    init(playerNumber: Int, router: ComputerGuessingNumberRouter) {
        self.playerNumber = playerNumber
        self.router = router
    }

    // MARK: - Functions

    func validateComputerAnswer(answer: NumberValid) {
        if answerIsCorrect(answer: answer) {
            switch answer {
            case .greater:
                game.minNumber = computer.number
                computer.attemptCount += 1
                let number = (game.minNumber + game.maxNumber) / 2
                computer.number = number
            case .less:
                game.maxNumber = computer.number
                computer.attemptCount += 1
                let number = (game.minNumber + game.maxNumber) / 2
                computer.number = number
            case .equal:
                isPlayerNumberGuesser = true
            }
        }
    }

    func pressedEqualButton() {
        router.showPlayerGuessingNumber(computerAttemptCount: computer.attemptCount)

    }

    // MARK: - Private functions

    private func answerIsCorrect(answer: NumberValid) -> Bool {
        if answer == .less && playerNumber >= computer.number {
            error = "The hidden number is not less than what the computer indicated"
            return false
        } else if answer == .greater && playerNumber <= computer.number {
            error = "The hidden number is not greater than what the computer indicated"
            return false
        } else if answer == .equal && playerNumber != computer.number {
            error = "The hidden number is not equal than what the computer indicated"
            return false
        }
        return true
    }
}
