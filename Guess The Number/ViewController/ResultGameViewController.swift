//
//  ResultGameViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 08.11.2022.
//

import UIKit

class ResultGameViewController: UIViewController {
    
    private lazy var resultGameView = ResultGameView()
    
    override func loadView() {
        self.view = resultGameView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

    }
    
    // MARK: - Navigation


}
