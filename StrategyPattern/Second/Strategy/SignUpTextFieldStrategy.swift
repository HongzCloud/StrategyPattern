//
//  SomeTextFieldStrategy.swift
//  StrategyPattern
//
//  Created by 오킹 on 2023/10/28.
//

import Foundation

struct SignUpTextFieldStrategy: SomeTextFieldStrategy {
    func next() -> NextPage {
        return .popToRoot
    }
    
    var ctaActionType: CTAActionType = .loginPage
    var item: TextFieldItem = .init(placeHolder: "이름을 입력해주세요",
                                    guideMessage: "대문자, 숫자, 특수문자만 입력 가능합니다.",
                                    errorMessage: "")
    var title: String = "회원가입"
    var placeholder: String = "10글자 이하"
    var ctaButtonTitle: String = "회원가입"

    func shouldActivateCTAButton(text: String) -> Bool {
       return isValid(text: text)
    }
    
    func updateTextFieldItemIfNeeded(text: String) -> TextFieldItem? {
        
        if text.isEmpty {
            return TextFieldItem(placeHolder: "이름를 입력해주세요",
                                 guideMessage: "대문자, 숫자, 특수문자만 입력 가능합니다.",
                                 errorMessage: "")
        }
        
        if isValid(text: text) {
            return TextFieldItem(placeHolder: "이름을 입력해주세요",
                                 guideMessage: "가입할 수 있는 이름입니다.",
                                 errorMessage: "")
        } else {
            return TextFieldItem(placeHolder: "이름을 입력해주세요",
                                 guideMessage: "",
                                 errorMessage: "가입할 수 없는 이름입니다.")
        }
    }
    
    private func isValid(text: String) -> Bool {
        guard !text.isEmpty else { return false }
        
        // 대문자, 숫자, 특수문자만 입력 가능
        let regexPattern = "^[A-Z0-9!@#$%^&*()_+{}\\[\\]:;<>,.?~\\\\/-]*$"
        let regex = try? NSRegularExpression(pattern: regexPattern)
        let matches = regex?.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))

        return matches?.count ?? 0 > 0
    }
}

