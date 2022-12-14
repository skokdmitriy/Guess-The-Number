//
//  UILabel+Extension.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 30.10.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont?) {
        self.init()
        self.text = text
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 0
        self.textAlignment = .center
    }
}
