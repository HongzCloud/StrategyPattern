//
//  ViewController.swift
//  StrategyPattern
//
//  Created by 오킹 on 2023/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTappedNextButton(_ sender: Any) {
        let viewController = SignUpViewController.create()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func secondButtonTapped(_ sender: Any) {
        let viewController = CommonTextFieldViewController.create(with: LoginTextFieldStrategy())
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

