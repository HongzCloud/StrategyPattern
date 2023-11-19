//
//  SignUpViewController.swift
//  StrategyPattern
//
//  Created by 오킹 on 2023/10/21.
//

import UIKit

final class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextFieldView: NameTextFieldView!
    @IBOutlet weak var resultLabel: UILabel!
    
    let textFieldStrategy: TextFieldStrategy! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 1번째 방법
    class func create() -> SignUpViewController {
        let viewController = UIStoryboard.viewController(SignUpViewController.self)
        
        return viewController
    }
    
    // 2번째 방법
    // 이전 화면에서 let viewController = UIStoryboard.viewController(SignUpViewController.self) 생성 후
    // 필요한 데이터들 프로퍼티로 접근해서 viewController.item = "" 넣어주기
    
    // 3번째 방법
    // 이전 화면에서 let viewController = UIStoryboard.viewController(SignUpViewController.self) 생성 후
    // 필요한 데이터들 메서드 접근해서 setup(with: item)에 넣어주기
    
    func configureTextField(with strategy: TextFieldStrategy) {
        strategy.isVaild(text: "")
    }
    
}

