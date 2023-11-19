//
//  EnterNumberRouter.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 16.11.2023.
//

import UIKit

final class EnterNumberRouter {
    weak var viewController: UIViewController?

    func showomputerGuessingNumber(playerNumber: Int) {
        if let viewController {
            let computerGuessingNumberViewController = ComputerGuessingNumberAssembley.build(playerNumber: playerNumber)
            computerGuessingNumberViewController.modalPresentationStyle = .fullScreen
            viewController.present(computerGuessingNumberViewController, animated: true)
        }
    }
}
