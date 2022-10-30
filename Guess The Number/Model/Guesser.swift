//
//  Guesser.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 26.09.2022.
//

import Foundation

class Guesser {
    var number: Int
    var attemptCount: Int = 1
    var numberGuessed: Bool = false
    
    init(number: Int) {
        self.number = number
    }
}
