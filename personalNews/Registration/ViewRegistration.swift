//
//  ViewRegistration.swift
//  personalNews
//
//  Created by Anrey on 12/11/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import UIKit


class ViewRegistration: FirstView, UITextFieldDelegate {
    

    @IBOutlet weak var scroolView: UIScrollView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordcheckTextField: UITextField!
    

    
// - - - - - - - - - - - - - - -
    override func awakeFromNib() {
        
        super .awakeFromNib()
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordcheckTextField.delegate = self
        
        newKeyboardNotification()
        
        massFieldmain.append(firstNameTextField)
        massFieldmain.append(lastNameTextField)
        massFieldmain.append(emailTextField)
        massFieldmain.append(passwordTextField)
        massFieldmain.append(passwordcheckTextField)
        
    }
    
    deinit {
        defaultKeyboardNotification()
    }

// MARK: - Navigation

// указание на обработчик события появления/скрытия клавиатуры
    func newKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
// вернуться на исходный обработчик события появления/скрытия клавиатуры
    func defaultKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

// сместится вверх на высоту клавиатуры
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        scroolView.contentOffset = CGPoint(x: 0, y: keyboardSize.height)
        }
    }
//  вернуть исходное положение
    @objc func keyboardWillHide(_ notification: Notification) {
        scroolView.contentOffset = CGPoint.zero
    }
// переход между полями ввода и
// убрать клавиатуру после нажатия Enter на последнем поле
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        // взять следующий обьэкт
        let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder!
        
        if nextResponder != nil {
            // следующее поле ввода
            nextResponder?.becomeFirstResponder()
        } else {
            // все - убрать клавиатуру
            textField.resignFirstResponder()
        }
        return true
    }
}
