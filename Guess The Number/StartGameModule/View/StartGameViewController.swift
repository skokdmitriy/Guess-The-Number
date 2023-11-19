//
//  StartGameViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 25.09.2022.
//

import UIKit

final class StartGameViewController: UIViewController {
    // MARK: - Private properties

    private let startGameView = StartGameView()
    private let viewModel: StartGameViewModel

    // MARK: - Initialization

    init(viewModel: StartGameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        
        view = startGameView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewController()
    }

    //MARK: - Private functions

    private func setupViewController() {
        view.backgroundColor = .white
        startGameView.startGameButton.addTarget(self,
                                                action: #selector(startGameButton(_:)),
                                                for: .touchUpInside
        )
    }

    @objc private func startGameButton(_ sender: UIButton) {
        viewModel.pressedStartGame()
    }
}
