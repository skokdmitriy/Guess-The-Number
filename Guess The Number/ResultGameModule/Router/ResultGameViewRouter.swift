//
//  ResultGameViewRouter.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 19.11.2023.
//

import UIKit

final class ResultGameViewRouter {
    weak var viewController: UIViewController?

    func showStart() {
        if let viewController {
            viewController.view.window?.rootViewController?.dismiss(animated: true)
        }
    }
}
