//
//  StartGameViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 25.09.2022.
//

import UIKit

class StartGameViewController: UIViewController {
    
    // MARK: - Private properties
    private lazy var startGameView = StartGameView()
        
    // MARK: - Override methods
    override func loadView() {
        super.loadView()
        self.view = startGameView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        startGameView.startGameButton.addTarget(self, action: #selector(startGameButton(_:)), for: .touchUpInside)
    }
    
    // MARK: - Navigation
    @objc private func startGameButton(_ sender: UIButton) {
        let viewController = EnterNumberViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    deinit {
        print("Start View Controller deinit")
    }
}
