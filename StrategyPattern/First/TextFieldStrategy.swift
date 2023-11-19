//
//  TextFieldStrategy.swift
//  StrategyPattern
//
//  Created by 오킹 on 2023/10/21.
//

import Foundation

protocol TextFieldStrategy {
    func isVaild(text: String) -> Bool
}
