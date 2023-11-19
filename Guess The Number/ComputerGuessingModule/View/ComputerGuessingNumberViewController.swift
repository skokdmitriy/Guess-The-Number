//
//  ComputerGuessingNumberViewController.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 28.09.2022.
//

import UIKit
import Combine

final class ComputerGuessingNumberViewController: UIViewController {
    // MARK: - Private properties

    private lazy var computerGuessingNumber = ComputerGuessingNumberView()
    private var subscriptions = Set<AnyCancellable>()
    private let viewModel: ComputerGuessingNumberViewModel

    // MARK: - Initialization

    init(viewModel: ComputerGuessingNumberViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        self.view = computerGuessingNumber
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewController()
        binding()
    }

    // MARK: - Private methods

    private func setupViewController() {
        view.backgroundColor = .white

        computerGuessingNumber.equalButton.addTarget(self, action: #selector(equalButtonPressed(_:)), for: .touchUpInside)
        computerGuessingNumber.greaterButton.addTarget(self, action: #selector(greaterButtonPressed(_:)), for: .touchUpInside)
        computerGuessingNumber.lessButton.addTarget(self, action: #selector(lessButtonPressed(_:)), for: .touchUpInside)
    }

    private func binding () {
        viewModel.$error
            .sink { error in
                DispatchQueue.main.async {
                    guard let errorDescription = self.viewModel.error else { return }
                    let alertController = self.getGameAlert(title: "Tricky bug", message: errorDescription)
                    self.present(alertController, animated: true)
                }
            }
            .store(in: &subscriptions)

        viewModel.$computer
            .sink { computer in
                self.computerGuessingNumber.guessesLabel.text = "Your number is: \(computer.number)?"
                self.computerGuessingNumber.numberOfGuessLabel.text = "Try №\(computer.attemptCount)"
            }
            .store(in: &subscriptions)
    }

    // MARK: - @objc methods
    @objc private func greaterButtonPressed(_ sender: UIButton) {
        viewModel.validateComputerAnswer(answer: .greater)
    }

    @objc private func lessButtonPressed(_ sender: UIButton) {
        viewModel.validateComputerAnswer(answer: .less)
    }

    @objc private func equalButtonPressed(_ sender: UIButton){
        viewModel.validateComputerAnswer(answer: .equal)
        if viewModel.isPlayerNumberGuesser == true {
            viewModel.pressedEqualButton()
        }
    }

    private func getGameAlert(title: String, message: String?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(actionOK)
        return alert
    }
}
