//
//  AssemblyBuilder.swift
//  Guess The Number
//
//  Created by Дмитрий Скок on 20.03.2023.
//

import UIKit

protocol AssemblyBuilderProtocol{
    static func createStartGameModule() -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    static func createStartGameModule() -> UIViewController {
        let view = StartGameViewController()
        return view
    }
    
    
}
