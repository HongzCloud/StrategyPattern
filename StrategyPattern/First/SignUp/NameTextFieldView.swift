//
//  NameTextFieldView.swift
//  StrategyPattern
//
//  Created by 오킹 on 2023/10/21.
//

import UIKit

class NameTextFieldView: UIView, UITextFieldDelegate, TextFieldStrategy {
  
    var textLimit: Int? = 6
    
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

        textField.delegate = self
        textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }
    
    @objc
    func textDidChange(_ sender: UITextField) {
        
        updateUI(text: sender.text)
    }

    func isVaild(text: String) -> Bool {
        // 대문자, 숫자, 특수문자 입력 가능
        let regexPattern = "^[A-Z0-9!@#$%^&*()_+{}\\[\\]:;<>,.?~\\\\/-]*$"
        let regex = try? NSRegularExpression(pattern: regexPattern)
        let matches = regex?.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))

        return matches?.count ?? 0 > 0
    }
    
    func updateUI(text: String?) {
        
        guard let text = text,
              !text.isEmpty else {
            descriptionLabel.text = nil
            return
        }
        
        if isVaild(text: text) {
            descriptionLabel.text = "사용할 수 있는 이름이에요."
        } else {
            descriptionLabel.text = "\(text)는 사용할 수 없는 이름이에요."
        }
    }
}
