//
//  UIStoryboard+ViewControllerInit.swift
//  StrategyPattern
//
//  Created by 오킹 on 2023/10/21.
//

import UIKit

extension UIStoryboard {

    static func viewController<T: UIViewController>(_ classType: T.Type) -> T {
        let identifier = String(describing: classType)
        let storyboard = UIStoryboard(name: identifier, bundle: nil)

        if let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T {
            return viewController
        } else {
            fatalError()
        }
    }
}
