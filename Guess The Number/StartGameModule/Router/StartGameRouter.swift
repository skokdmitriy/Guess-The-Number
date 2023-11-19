//
//  StartGameRouter.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 12.11.2023.
//

import UIKit

final class StartGameRouter {
    weak var viewController: UIViewController?

    func showEnterNumber() {
        if let viewController {
            let enterNumberViewController = EnterNumberAssembley.build()
            enterNumberViewController.modalPresentationStyle = .fullScreen
            viewController.present(enterNumberViewController, animated: true)
        }
    }
}
