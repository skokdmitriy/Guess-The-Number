//
//  ResultGameView.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 06.11.2022.
//

import UIKit

class ResultGameView: UIView {
    let scoresLabel = UILabel(text: "Scores:", font: .avenir26())
    let playerTriesCountLabel = UILabel(text: "Your's tries count: ", font: .avenir26())
    let computerTriesCountLabel = UILabel(text: "Computer's tries count: ", font: .avenir26())
    let winnerLabel = UILabel(text: "Win ", font: .avenir26())
    let goToMainMenuButton = UIButton(title: "Start over", titleColor: .white, backgroundColor: .systemBlue, font: .avenir20())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(scoresLabel)
        addSubview(playerTriesCountLabel)
        addSubview(computerTriesCountLabel)
        addSubview(winnerLabel)
        addSubview(goToMainMenuButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scoresLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            scoresLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            scoresLabel.bottomAnchor.constraint(lessThanOrEqualTo: playerTriesCountLabel.topAnchor),
            
            playerTriesCountLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            playerTriesCountLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            playerTriesCountLabel.bottomAnchor.constraint(lessThanOrEqualTo: computerTriesCountLabel.topAnchor, constant: -20),
            
            computerTriesCountLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            computerTriesCountLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            computerTriesCountLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            computerTriesCountLabel.bottomAnchor.constraint(lessThanOrEqualTo: winnerLabel.topAnchor),
            
            winnerLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            winnerLabel.bottomAnchor.constraint(lessThanOrEqualTo: goToMainMenuButton.topAnchor, constant: -50),
            
            goToMainMenuButton.heightAnchor.constraint(equalToConstant: 48),
            goToMainMenuButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            goToMainMenuButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            goToMainMenuButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            goToMainMenuButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}
