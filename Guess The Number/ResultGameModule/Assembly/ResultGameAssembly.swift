//
//  ResultGameAssembly.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 19.11.2023.
//

import UIKit

final class ResultGameAssembly {
    static func build(playerAttemptCount: Int, computerAttemptCount: Int) -> UIViewController {
        let router = ResultGameViewRouter()
        let viewModel = ResultGameViewModel(router: router,
                                            playerAttemptCount: playerAttemptCount,
                                            computerAttemptCount: computerAttemptCount
        )
        let viewController = ResultGameViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
