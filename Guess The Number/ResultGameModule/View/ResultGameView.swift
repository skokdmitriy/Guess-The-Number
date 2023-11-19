//
//  ResultGameView.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 06.11.2022.
//

import UIKit

class ResultGameView: UIView {
    // MARK: - Views

    lazy var scoresLabel: UILabel = {
        let label = UILabel()
        label.text = "Scores:"
        label.font = .avenir26()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var playerTriesCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Your's tries count: "
        label.font = .avenir26()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var computerTriesCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Computer's tries count: "
        label.numberOfLines = 2
        label.font = .avenir26()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var winnerLabel: UILabel = {
        let label = UILabel()
        label.text = "Win "
        label.font = .avenir26()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var goToMainMenuButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.configuration?.cornerStyle = .capsule
        button.setTitle("Start over", for: .normal)
        button.titleLabel?.font = .avenir20()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var triesCountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.addArrangedSubview(playerTriesCountLabel)
        stackView.addArrangedSubview(computerTriesCountLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private functions

    private func setupConstraints() {
        addSubview(scoresLabel)
        addSubview(triesCountStackView)
        addSubview(winnerLabel)
        addSubview(goToMainMenuButton)

        NSLayoutConstraint.activate([
            scoresLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            scoresLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),

            triesCountStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            triesCountStackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            triesCountStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            triesCountStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            winnerLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            winnerLabel.bottomAnchor.constraint(equalTo: goToMainMenuButton.topAnchor, constant: -50),

            goToMainMenuButton.heightAnchor.constraint(equalToConstant: 48),
            goToMainMenuButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            goToMainMenuButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            goToMainMenuButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            goToMainMenuButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}
