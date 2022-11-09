//
//  PlayerGuessingNumberViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 06.11.2022.
//

import UIKit

class PlayerGuessingNumberViewController: UIViewController {
    
    private lazy var playerGuessingNumberView = PlayerGuessingNumberView()
    
    override func loadView() {
        self.view = playerGuessingNumberView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    
    
    // MARK: - Navigation


}
