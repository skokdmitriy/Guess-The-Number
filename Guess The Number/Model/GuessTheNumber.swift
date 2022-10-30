//
//  GuessTheNumber.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 25.09.2022.
//

import Foundation

struct GuessTheNumber {
    var minNumber: Int = 1
    var maxNumber: Int = 100
    
    var player = Guesser(number: 0)
    var computer = Guesser(number: 0)
}
