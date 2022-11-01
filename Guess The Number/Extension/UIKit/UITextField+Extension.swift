//
//  UITextField+Extension.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 30.10.2022.
//

import UIKit

extension UITextField {
    
    convenience init(font: UIFont? = .avenir20(), placeholder: String) {
        self.init()
        
        self.font = font
        self.placeholder = placeholder
        
        self.borderStyle = .roundedRect
        self.keyboardType = .numberPad
        self.returnKeyType = .continue
        self.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
