//
//  EnterNumberViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 26.09.2022.
//

import UIKit

class EnterNumberViewController: UIViewController {
    
    // MARK: - Private properties
    private lazy var enterNumberView = EnterNumberView()
    
    // MARK: - Public properties
    var viewModel: GameViewModel!

    // MARK: - Override methods
    override func loadView() {
        super.loadView()
        self.view = enterNumberView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        enterNumberView.enterNumberButton.addTarget(self, action: #selector(enterNumberButtonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func enterNumberButtonPressed(_ sender: UIButton) {
        guard let inputValue = enterNumberView.numberTextField.text else { return }
        if let number = Int(inputValue) {
            if number >= 1 && number <= 100 {
                viewModel.game.player.number = number
                computerGuessingNumber()
            } else {
                showErrorAlert()
                enterNumberView.numberTextField.text = ""
            }
        } else {
            showErrorAlert()
        }
    }
    
    // MARK: - Navigation
    private func computerGuessingNumber() {
        let viewController = ComputerGuessingNumberViewController()
        viewController.viewModel = self.viewModel
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .coverVertical
        present(viewController, animated: true)
    }
    
    private func showErrorAlert() {
        let alert = AlertController(title: "Error", message: "Enter a number from 1 to 100")
        present(alert, animated: true)
    }
    
    private func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text == nil {
            enterNumberView.enterNumberButton.isEnabled = true
        } else {
            enterNumberView.enterNumberButton.isEnabled = false
        }
    }
    
    deinit {
        print("EnterNumberViewController deinit")
    }
}

extension EnterNumberViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
