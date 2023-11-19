//
//  TextFieldView.swift
//  StrategyPattern
//
//  Created by 오킹 on 2023/10/28.
//

import UIKit

class TextFieldView: UIView, UITextFieldDelegate {

    var textField: UITextField = {
        var view = UITextField()
        view.placeholder = "아이디를 입력해주세요."
        view.borderStyle = .roundedRect
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var descriptionLabel: UILabel = {
        var view = UILabel()
        view.text = "설명"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
        self.addSubview(textField)
        self.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    func configure(with item: TextFieldItem) {
        if item.errorMessage.isEmpty {
            descriptionLabel.text = item.guideMessage
            descriptionLabel.textColor = .black
        } else {
            descriptionLabel.text = item.errorMessage
            descriptionLabel.textColor = .red
        }
        
        textField.placeholder = item.placeHolder
    }
}
