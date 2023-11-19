//
//  PlayerGuessingNumberAssembly.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 19.11.2023.
//

import UIKit

final class PlayerGuessingNumberAssembly{
    static func build(computerAttemptCount: Int) -> UIViewController{
        let router = PlayerGuessingNumberRouter()
        let viewModel = PlayerGuessingNumberViewModel(router: router, computerAttemptCount: computerAttemptCount)
        let viewController = PlayerGuessingNumberViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
