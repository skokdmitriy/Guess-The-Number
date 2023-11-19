//
//  StartGameViewModel.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 13.11.2023.
//

import Foundation

protocol StartGameViewModelProtocol {
    func pressedStartGame()
}

final class StartGameViewModel: StartGameViewModelProtocol {
    private let router: StartGameRouter

    init(router: StartGameRouter) {
        self.router = router
    }

    func pressedStartGame() {
        router.showEnterNumber()
    }
}
