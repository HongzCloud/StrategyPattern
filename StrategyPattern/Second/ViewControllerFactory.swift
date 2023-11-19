//
//  ViewControllerFactory.swift
//  StrategyPattern
//
//  Created by 오킹 on 2023/10/28.
//

import UIKit

protocol ViewControllerFactory {
    associatedtype ViewControllerType: UIViewController
    associatedtype ModelType
    
    static func create(with model: ModelType) -> ViewControllerType
}
