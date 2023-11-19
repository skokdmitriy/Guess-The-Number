//
//  PlayerGuessingNumberRouter.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 19.11.2023.
//

import UIKit

final class PlayerGuessingNumberRouter {
    weak var viewController: UIViewController?

    func showResultGame(playerAttemptCount: Int, computerAttemptCount: Int) {
        if let viewController {
            let resultGameViewController = ResultGameAssembly.build(playerAttemptCount: playerAttemptCount, computerAttemptCount: computerAttemptCount)
            resultGameViewController.modalPresentationStyle = .fullScreen
            viewController.present(resultGameViewController, animated: true)
        }
    }
}

