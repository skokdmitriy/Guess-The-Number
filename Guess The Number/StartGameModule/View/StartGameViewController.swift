//
//  StartGameViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 25.09.2022.
//

import UIKit

final class StartGameViewController: UIViewController {

    // MARK: - Subviews

    private lazy var startTitleLabel = UILabel(text: Constants.startTitleText, font: .avenir26())

    private lazy var startGameButton: UIButton = {
        let button = UIButton(title: Constants.startGameButtonTitle,
                              titleColor: .white,
                              backgroundColor: .systemBlue,
                              font: .avenir20())
        button.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureLayout()
    }

    // MARK: - Private

    private func configureLayout() {
        view.addSubview(startTitleLabel)
        view.addSubview(startGameButton)

        NSLayoutConstraint.activate([
            startTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            startTitleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),

            startGameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            startGameButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            startGameButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            startGameButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            startGameButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    @objc private func startGameButtonTapped() {
        let viewController = EnterNumberViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }

    deinit {}
}
