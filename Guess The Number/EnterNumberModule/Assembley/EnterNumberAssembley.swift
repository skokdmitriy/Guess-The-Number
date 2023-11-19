//
//  EnterNumberAssembley.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 19.11.2023.
//

import UIKit

final class EnterNumberAssembley {
    static func build() -> UIViewController {
        let router = EnterNumberRouter()
        let viewModel = EnterNumberViewModel(router: router)
        let viewController = EnterNumberViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
