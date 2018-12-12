//
//  ViewRegistration.swift
//  personalNews
//
//  Created by Anrey on 12/11/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import UIKit

protocol viewRegistrationProtocol {
     func checkFieldnotEmply() -> Int
     func checkValidInform() ->Int
     func changeFieldborger(numfield: Int) 
}


class ViewRegistration: UIView, UITextFieldDelegate, viewRegistrationProtocol {
    

    @IBOutlet weak var scroolView: UIScrollView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordcheckTextField: UITextField!
    
    var massField: [UITextField] = []
    
// - - - - - - - - - - - - - - -
    override func awakeFromNib() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordcheckTextField.delegate = self
        
        newKeyboardNotification()
        
        massField.append(firstNameTextField)
        massField.append(lastNameTextField)
        massField.append(emailTextField)
        massField.append(passwordTextField)
        massField.append(passwordcheckTextField)
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

// при ошибке - цвет бордюра - красный
    func changeFieldborger(numfield: Int) {
        massField[numfield-1].setBorderColor(width: 2.0, color: .red)
        massField[numfield-1].becomeFirstResponder()
    }
    
    
//  при редактировании - цвет бордюра в исх.
    @IBAction func editTextField(_ sender: UITextField) {
        sender.setBorderColor(width: 1.0, color: .gray)
        return
    }

// проверка на пустые строки
    func checkFieldnotEmply() -> Int {
        for field in massField {
            if (field.text)!.isEmpty {
                return field.tag
            }
        }
        return 0
    }
    
// проверка правильности ввода
    func checkValidInform() ->Int {
        if !(massField[2].text?.isValidEmail())! {
            return 2
        } else if (massField[3].text?.count)! < passLength {
            return 3
        } else if (massField[3].text)! != (massField[4].text)! {
            return 4
        } else {
            return 0
        }
    }
    

    
}
