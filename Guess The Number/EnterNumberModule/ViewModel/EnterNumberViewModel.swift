//
//  EnterNumberViewModel.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 16.11.2023.
//

import Foundation
import Combine

final class EnterNumberViewModel {
    // MARK: - Properties

    var player = Guesser()

    // MARK: - Private properties

    private let router: EnterNumberRouter

    // MARK: - Initialization

    init(router: EnterNumberRouter) {
        self.router = router
    }

    // MARK: - Functions

    func pressedEnterNumberButton() {
        router.showomputerGuessingNumber(playerNumber: player.number)
    }

}
