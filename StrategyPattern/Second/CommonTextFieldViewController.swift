//
//  CommonTextFieldViewController.swift
//  StrategyPattern
//
//  Created by 오킹 on 2023/10/28.
//

import UIKit

class CommonTextFieldViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldView: TextFieldView!
    @IBOutlet weak var ctaButton: UIButton!
    
    var strategy: SomeTextFieldStrategy? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        ctaButton.isEnabled = false
        
        guard let strategy = strategy else { return }
        
        title = strategy.title
        textFieldView.configure(with: strategy.item)
        ctaButton.setTitle(strategy.ctaButtonTitle, for: .normal)
        textFieldView.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }
    
    @objc
    func textDidChange(_ sender: UITextField) {
        guard let text = sender.text else { return }
        
        let isActiveCTAButton = strategy?.shouldActivateCTAButton(text: text)
        
        ctaButton.isEnabled = isActiveCTAButton ?? false
        
        if let textFieldItem = strategy?.updateTextFieldItemIfNeeded(text: text) {
            textFieldView.configure(with: textFieldItem)
        }
    }
    
    @IBAction func ctaButtonTapped(_ sender: Any) {

        guard let nextPage = strategy?.next() else { return }
        
        switch nextPage {
        case .next(let nextStrategy):
            navigationController?.pushViewController(CommonTextFieldViewController.create(with: nextStrategy), animated: true)
        case .main:
            break
            // self.present(MainViewController(), animated: true)
        case .popToRoot:
            navigationController?.popToRootViewController(animated: true)
        case .webView(let url):
            break
            //self.present(WebViewController, animated: true)
        }
    }
}

// Init
extension CommonTextFieldViewController: ViewControllerFactory {
    typealias ModelType = SomeTextFieldStrategy
    typealias ViewControllerType = CommonTextFieldViewController
    
    static func create(with strategy: SomeTextFieldStrategy) -> CommonTextFieldViewController {
        let viewController = UIStoryboard.viewController(CommonTextFieldViewController.self)
        viewController.strategy = strategy
        return viewController
    }
}


// 들었던 생각
// 1. Swift에서 extension이 있기 때문에 스트래티지 패턴을 굳이 써야되나?
//
//class TestViewController: SomeTextFieldStrategy { }
//
//extension TestViewController: SomeTextFieldStrategy {
//    var title: String
//    var placeholder: String
//}
//
//이렇게 extension과 델리게이션 패턴을 사용하면 보다 더 확장성 있는 프로그래밍이 될 텐데 왜 스트래티지 패턴을 사용하는 거지?

// 2. UI은 같은데 Action이 다르면 분기처리를 해줘야 할 텐데?
// 분기처리 떄문에 코드가 더러워진다. 분기처리 안하려면 외부에서 주입해줘야 하는데
// 해당 뷰컨틀러 내부의 값을 가지고 다음 Action을 하는 것이라서 화면에 하나의 버튼만 있는게 아니라
// 많아지면 보기 힘들 것 같다.
// -> 해결 방법
// 1. Strategy 내부에 action을 넣어주되 매개변수에 UIViewController를 넣는다.
// 2. Strategy 내부에 행동 case를 넣고 분기처리를 한다.
// 3. 외부에서 클로저 프로퍼티를 주입하여 사용한다.

// 3. 네트워크 로직은 Strategy에서 하지 않는 것인가?
//    Strategy과 모델과의 차이점은?? ViewModel과 같은 것 아닌가?
//    MVVM에서 ViewModel을 스트래티지 패턴으로 사용할 수도 있을 듯. 그러나 유연성이 굉장히 떨어질 듯
//

