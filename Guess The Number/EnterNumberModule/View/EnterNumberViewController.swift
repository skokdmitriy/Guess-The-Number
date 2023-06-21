//
//  EnterNumberViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 26.09.2022.
//

import UIKit

final class EnterNumberViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var enterNumberTextField = UITextField(placeholder: Constants.enterNumberTextPlaceholder)
    
    private lazy var enterNumberButton: UIButton = {
        let button = UIButton(title: Constants.enterNumberButtonTitle,
                              titleColor: .white,
                              backgroundColor: .systemBlue, font: .avenir20()
        )
        button.addTarget(self, action: #selector(enterNumberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Public properties
    
    var viewModel = GameViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureLayout()
        setupDismissKeyboardGesture()
        registerForKeyboardNotification()
    }
    
    // MARK: - Private
    
    private func configureLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(enterNumberTextField)
        scrollView.addSubview(enterNumberButton)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            enterNumberTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            enterNumberTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            enterNumberTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            enterNumberTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 150),
            
            enterNumberButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            enterNumberButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            enterNumberButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            enterNumberButton.topAnchor.constraint(equalTo: enterNumberTextField.bottomAnchor, constant: 350),
            enterNumberButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50),
            enterNumberButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    @objc func enterNumberButtonPressed(_ sender: UIButton) {
        guard let inputValue = enterNumberTextField.text else { return }
        if let number = Int(inputValue) {
            if number >= 1 && number <= 100 {
                viewModel.game.player.number = number
                computerGuessingNumber()
            } else {
                showErrorAlert()
                enterNumberTextField.text = ""
            }
        } else {
            showErrorAlert()
        }
    }
    
    private func computerGuessingNumber() {
        let viewController = ComputerGuessingNumberViewController()
        viewController.viewModel = self.viewModel
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .coverVertical
        present(viewController, animated: true)
    }
    
    private func showErrorAlert() {
        let alert = AlertController(title: Constants.alertTitleError, message: Constants.alertMessageError)
        present(alert, animated: true)
    }
    
    private func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text == nil {
            enterNumberButton.isEnabled = true
        } else {
            enterNumberButton.isEnabled = false
        }
    }
    
    deinit {}
}

extension EnterNumberViewController {
    private func setupDismissKeyboardGesture() {
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_: )))
        view.addGestureRecognizer(dismissKeyboardTap)
    }
    
    @objc private func viewTapped(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == UIGestureRecognizer.State.ended {
            view.endEditing(true)
        }
    }
    
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHideShow), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        if let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue  {
            let edgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height, right: 0)
            scrollView.contentInset = edgeInsets
            scrollView.scrollIndicatorInsets = edgeInsets
        }
    }
    
    @objc func keyboardHideShow() {
        scrollView.contentOffset = CGPoint.zero
    }
}
