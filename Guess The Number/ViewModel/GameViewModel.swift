//
//  GameViewModel.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 09.11.2022.
//

import Foundation
import Combine

class GameViewModel {
    @Published var error: String?
    @Published var game = GuessTheNumber()
    
    func generateRandomNumber() -> Int {
        return Int.random(in: game.minNumber...game.maxNumber)
    }
    
    func validateComputerAnswer(answer: NumberValid) {
        if answerIsCorrect(answer: answer) {
            switch answer {
            case .greater:
                game.minNumber = game.computer.number
                game.computer.attemptCount += 1
                let number = (game.minNumber + game.maxNumber) / 2
                print(game.computer.attemptCount)
                game.computer.number = number
            case .less:
                game.maxNumber = game.computer.number
                game.computer.attemptCount += 1
                let number = (game.minNumber + game.maxNumber) / 2
                print(game.computer.attemptCount)
                game.computer.number = number
            case .equal:
                game.player.numberGuessed = true
                print(game.computer.attemptCount)
            }
        }
    }
    
    func validatePlayerAnswer(guess: Int) -> NumberValid {
        if game.computer.number < guess {
            game.player.attemptCount += 1
            return .less
        } else if game.computer.number > guess {
            game.player.attemptCount += 1
            return .greater
        } else {
            game.player.numberGuessed = true
            return .equal
        }
    }
    
    func answerIsCorrect(answer: NumberValid) -> Bool {
        if answer == .less && game.player.number >= game.computer.number {
            error = "The hidden number is not less than what the computer indicated"
            return false
        } else if answer == .greater && game.player.number <= game.computer.number {
            error = "The hidden number is not greater than what the computer indicated"
            return false
        } else if answer == .equal && game.player.number != game.computer.number {
            error = "The hidden number is not equal than what the computer indicated"
            return false
        }
        return true
    }
    
}
