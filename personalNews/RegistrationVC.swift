//
//  RegistrationVC.swift
//  personalNews
//
//  Created by Anrey on 11/4/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scroolView: UIScrollView!
    
    @IBOutlet weak var passcheckField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!

    var massField: [UITextField] = []
    
// - - - - - - - - -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)

        passcheckField.delegate = self
        passwordField.delegate = self
        addressField.delegate = self
        lastNameField.delegate = self
        firstNameField.delegate = self
        
        newKeyboardNotification()
        
        massField.append(firstNameField)
        massField.append(lastNameField)
        massField.append(addressField)
        massField.append(passwordField)
        massField.append(passcheckField)
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
//  вкернуть исходное положение
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
    
//  при редактировании - цвет бордюра в исх.
    @IBAction func editTextField(_ sender: UITextField) {
        sender.setBorderColor(width: 1.0, color: .gray)
        return
    }
    
// сообщение об ошибке ввода
    func allertErrorTextField(err: Bool, nummessage: String, field : UITextField) {
        if err {
        let allertController = UIAlertController(title: "Error", message: nummessage, preferredStyle: UIAlertController.Style.alert)
        allertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        field.setBorderColor(width: 1.0, color: .red)
        field.becomeFirstResponder()
        self.present(allertController, animated: true, completion: nil)
        } else {
            let allertController = UIAlertController(title: "Information", message: nummessage, preferredStyle: UIAlertController.Style.alert)
            //закрыть окно по нажатию ОК
            allertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default){(action: UIAlertAction!) -> Void in
                self.navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)})
            self.present(allertController, animated: true, completion: nil)
        }
        return
    }
    
    
// проверка на пустые строки
    func checkFieldnotEmply() -> Bool {
        for field in massField {
            let fieldText = (field.text)!
            if fieldText.isEmpty {
                allertErrorTextField(err: true, nummessage: "Поле \(typeMessageError[field.tag - 1]) не должно быть пустым", field: field)
                return false
            }
        }
        return true
    }
    
    
// проверка правильности ввода
    func checkValidInform() ->Bool {
        if !(massField[2].text?.isValidEmail())! {
            allertErrorTextField(err: true, nummessage: typemessage[2], field: massField[2])
            return false
        } else if (massField[3].text?.count)! < passLength {
                allertErrorTextField(err: true, nummessage: typemessage[3], field: massField[3])
                return false
        } else if (massField[3].text)! != (massField[4].text)! {
               allertErrorTextField(err: true, nummessage: typemessage[4], field: massField[4])
               return false
        } else {
            return true
        }
    }
    
// нажатие кнопки save
// проверка на правильность введения информации
    @IBAction func saveButton(_ sender: UIButton) {
        if checkFieldnotEmply() {
          // проверить на правильность ввода информации
            if checkValidInform() {
              allertErrorTextField(err: false, nummessage: "Вы зарегестрированы, войдите в програму с Вашей учетной записью", field: massField[4])
            }
        }
        return
    }
    

}
