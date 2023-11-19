//
//  EnterNumberViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 26.09.2022.
//

import UIKit

final class EnterNumberViewController: UIViewController {

    // MARK: - Private properties

    private lazy var enterNumberView = EnterNumberView()
    private let viewModel: EnterNumberViewModel

    // MARK: - Initialization

    init(viewModel: EnterNumberViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()

        self.view = enterNumberView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewController()
    }

    // MARK: - Private functions

    @objc private func enterNumberButtonPressed(_ sender: UIButton) {
        guard let inputValue = enterNumberView.numberTextField.text else { return }
        if let number = Int(inputValue) {
            if number >= 1 && number <= 100 {
                viewModel.player.number = number
                viewModel.pressedEnterNumberButton()
            } else {
                showErrorAlert()
                enterNumberView.numberTextField.text = ""
            }
        } else {
            showErrorAlert()
        }
    }

    private func setupViewController() {
        view.backgroundColor = .white
        enterNumberView.enterNumberButton.addTarget(self, action: #selector(enterNumberButtonPressed(_:)), for: .touchUpInside)
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
}

// MARK: - Extension

extension EnterNumberViewController {

    /// Closing keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
