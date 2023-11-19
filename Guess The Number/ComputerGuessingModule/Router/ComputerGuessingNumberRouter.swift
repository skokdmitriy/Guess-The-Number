//
//  ComputerGuessingNumberRouter.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 19.11.2023.
//

import UIKit

final class ComputerGuessingNumberRouter {
    weak var viewController: UIViewController?

    func showPlayerGuessingNumber(computerAttemptCount: Int) {
        if let viewController {
            let playerGuessingNumberViewController = PlayerGuessingNumberAssembly.build(computerAttemptCount: computerAttemptCount)
            playerGuessingNumberViewController.modalPresentationStyle = .fullScreen
            viewController.present(playerGuessingNumberViewController, animated: true)
        }
    }
}
