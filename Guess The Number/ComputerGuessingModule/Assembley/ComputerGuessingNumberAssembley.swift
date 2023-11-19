//
//  ComputerGuessingNumberAssembley.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 19.11.2023.
//

import UIKit

final class ComputerGuessingNumberAssembley {
    static func build(playerNumber: Int) -> UIViewController {
        let router = ComputerGuessingNumberRouter()
        let viewModel = ComputerGuessingNumberViewModel(playerNumber: playerNumber,
                                                        router: router
        )
        let viewController = ComputerGuessingNumberViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}

