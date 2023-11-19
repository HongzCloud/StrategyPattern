//
//  SomeTextFieldStrategy.swift
//  StrategyPattern
//
//  Created by 오킹 on 2023/10/28.
//

import Foundation

enum CTAActionType {
    case signUpPage
    case loginPage
}

enum NextPage {
    case next(SomeTextFieldStrategy)
    case popToRoot
    case main
    case webView(URL)
}

struct TextFieldItem {
    var placeHolder: String
    var guideMessage: String
    var errorMessage: String
}

protocol SomeTextFieldStrategy {
    var title: String { get }
    var item: TextFieldItem { get }
    var ctaButtonTitle: String { get }
    var ctaActionType: CTAActionType { get }
    
    func shouldActivateCTAButton(text: String) -> Bool
    func updateTextFieldItemIfNeeded(text: String) -> TextFieldItem?
    func next() -> NextPage
}
