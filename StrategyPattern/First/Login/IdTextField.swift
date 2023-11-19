//
//  IdTextField.swift
//  StrategyPattern
//
//  Created by 오킹 on 2023/10/21.
//

import UIKit

class IdTextFieldView: UIView, UITextFieldDelegate, TextFieldStrategy {
  
    var textLimit: Int? = nil
    
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
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return true
        }
     
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        
        return isVaild(text: newString)
    }

    func isVaild(text: String) -> Bool {
        guard let textLimit = textLimit else { return true }
        return text.count <= textLimit
    }
}
