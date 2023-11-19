//
//  ResultGameViewModel.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 19.11.2023.
//

import Foundation

final class ResultGameViewModel {
    let playerAttemptCount: Int
    let computerAttemptCount: Int

    private let router: ResultGameViewRouter

    init(router: ResultGameViewRouter, playerAttemptCount: Int, computerAttemptCount: Int) {
        self.router = router
        self.playerAttemptCount = playerAttemptCount
        self.computerAttemptCount = computerAttemptCount
    }

    func restart() {
        router.showStart()
    }
}
