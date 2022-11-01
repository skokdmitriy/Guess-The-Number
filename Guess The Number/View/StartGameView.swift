//
//  StartGameView.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 25.09.2022.
//

import UIKit

class StartGameView: UIView {
    
    //    MARK: - Subviews
    
    let startTitleLabel = UILabel(text: "My Awesome Game", font: .avenir26())
    let startGameButton = UIButton(title: "Start New Game", titleColor: .white, backgroundColor: .systemBlue, font: .avenir20())
    
    //    MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - UI
    
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


