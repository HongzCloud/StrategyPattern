//
//  LoginTextFieldStrategy.swift
//  StrategyPattern
//
//  Created by 오킹 on 2023/10/28.
//

import Foundation

struct LoginTextFieldStrategy: SomeTextFieldStrategy {
    func next() -> NextPage {
        return .next(SignUpTextFieldStrategy())
    }
   
    var ctaActionType: CTAActionType = .signUpPage
    var title: String = "로그인"
    var item: TextFieldItem = .init(placeHolder: "아이디를 입력해주세요",
                                    guideMessage: "ID는 6글자 이하이여야 합니다.",
                                    errorMessage: "")
    var ctaButtonTitle: String = "회원가입"
    
    func shouldActivateCTAButton(text: String) -> Bool {
        return isValid(text: text)
    }
    
    func updateTextFieldItemIfNeeded(text: String) -> TextFieldItem? {
        
        if text.isEmpty {
            return TextFieldItem(placeHolder: "아이디를 입력해주세요",
                                 guideMessage: "ID는 6글자 이하이여야 합니다.",
                                 errorMessage: "")
        }
        
        if isValid(text: text) {
            return TextFieldItem(placeHolder: "아이디를 입력해주세요",
                                 guideMessage: "가입할 수 아이디입니다.",
                                 errorMessage: "")
        } else {
            return TextFieldItem(placeHolder: "아이디를 입력해주세요",
                                 guideMessage: "",
                                 errorMessage: "가입할 수 없는 아이디입니다.")
        }
    }
    
    private func isValid(text: String) -> Bool {
        guard !text.isEmpty else { return false }
        
        return text.count <= 6
    }
}
