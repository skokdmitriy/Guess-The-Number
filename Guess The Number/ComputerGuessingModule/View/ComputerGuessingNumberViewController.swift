//
//  ComputerGuessingNumberViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 28.09.2022.
//

import UIKit
import Combine

final class ComputerGuessingNumberViewController: UIViewController {

    // MARK: - Subviews

    private lazy var numberOfGuessLabel = UILabel(text: Constants.numberOfGuessText,font: .avenir26())
    private lazy var computerGuessesLabel = UILabel(text: Constants.computerGuessesText, font: .avenir26())
    private lazy var guessesLabel = UILabel(text: Constants.guessesText, font: .avenir26())
    private lazy var numberIsLabel = UILabel(text: Constants.numberIsText, font: .avenir20())

    private lazy var greaterButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.setImage(UIImage(systemName: Constants.greaterButtonImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(greaterButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var equalButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.setImage(UIImage(systemName: Constants.equalButtonImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(equalButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var lessButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.setImage(UIImage(systemName: Constants.lessButtonImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(lessButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.addArrangedSubview(greaterButton)
        stackView.addArrangedSubview(equalButton)
        stackView.addArrangedSubview(lessButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Private properties

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Properties

    var viewModel = GameViewModel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        viewModel.game.computer.number = viewModel.generateRandomNumber()
        configureLayout()
        setupBinding()
    }

    // MARK: - Private

    private func configureLayout () {
        view.addSubview(numberOfGuessLabel)
        view.addSubview(computerGuessesLabel)
        view.addSubview(guessesLabel)
        view.addSubview(numberIsLabel)
        view.addSubview(buttonStackView)

        NSLayoutConstraint.activate([
            numberOfGuessLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            numberOfGuessLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            numberOfGuessLabel.bottomAnchor.constraint(lessThanOrEqualTo: computerGuessesLabel.topAnchor),

            computerGuessesLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            computerGuessesLabel.topAnchor.constraint(equalTo: numberOfGuessLabel.bottomAnchor, constant: 10),
            computerGuessesLabel.bottomAnchor.constraint(lessThanOrEqualTo: guessesLabel.topAnchor),

            guessesLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            guessesLabel.topAnchor.constraint(equalTo: computerGuessesLabel.bottomAnchor, constant: 100),
            guessesLabel.bottomAnchor.constraint(lessThanOrEqualTo: numberIsLabel.topAnchor),

            numberIsLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            numberIsLabel.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor),
            numberIsLabel.bottomAnchor.constraint(lessThanOrEqualTo: buttonStackView.topAnchor, constant: -10),

            buttonStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),

            greaterButton.heightAnchor.constraint(equalToConstant: 50),
            greaterButton.widthAnchor.constraint(equalToConstant: 50),

            equalButton.heightAnchor.constraint(equalToConstant: 50),
            equalButton.widthAnchor.constraint(equalToConstant: 50),

            lessButton.heightAnchor.constraint(equalToConstant: 50),
            lessButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setupBinding () {
        viewModel.$error
            .sink { error in
                DispatchQueue.main.async {
                    guard let errorDescription = self.viewModel.error else {
                        return
                    }
                    let alertController = self.getGameAlert(title: Constants.getGameAlertTitle, message: errorDescription)
                    self.present(alertController, animated: true)
                }
            }
            .store(in: &subscriptions)

        viewModel.$game
            .sink { game in
                self.guessesLabel.text = "\(Constants.guessesText) \(game.computer.number)?"
                self.numberOfGuessLabel.text = Constants.numberOfGuessText + String(game.computer.attemptCount)
            }
            .store(in: &subscriptions)
    }

    @objc private func greaterButtonPressed(_ sender: UIButton) {
        viewModel.validateComputerAnswer(answer: .greater)
    }

    @objc private func lessButtonPressed(_ sender: UIButton) {
        viewModel.validateComputerAnswer(answer: .less)
    }

    @objc private func equalButtonPressed(_ sender: UIButton){
        viewModel.validateComputerAnswer(answer: .equal)
        if viewModel.game.player.numberGuessed == true {
            playerGuessingNumber()
        }
    }

    private func playerGuessingNumber() {
        let viewController = PlayerGuessingNumberViewController()
        viewController.viewModel = self.viewModel
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }

    func getGameAlert(title: String, message: String?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: Constants.actionTitleOk, style: .default)
        alert.addAction(actionOK)
        return alert
    }

    deinit {}
}
