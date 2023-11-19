//
//  StartGameAssembley.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 13.11.2023.
//

import UIKit

final class StartGameAssembley {
    static func build() -> UIViewController {
        let router = StartGameRouter()
        let viewModel = StartGameViewModel(router: router)
        let viewController = StartGameViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
