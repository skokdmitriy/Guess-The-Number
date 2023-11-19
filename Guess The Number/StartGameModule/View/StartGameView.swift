//
//  StartGameView.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 25.09.2022.
//

import UIKit

final class StartGameView: UIView {
    // MARK: - Views

    private lazy var startTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "My Awesome Game"
        label.font = .avenir26()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    lazy var startGameButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.configuration?.cornerStyle = .capsule
        button.setTitle("Start New Game", for: .normal)
        button.titleLabel?.font = .avenir20()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private functions

    private func setupLayout() {
        addSubview(startTitleLabel)
        addSubview(startGameButton)

        NSLayoutConstraint.activate([
            startTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            startTitleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            startGameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            startGameButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            startGameButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            startGameButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            startGameButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
