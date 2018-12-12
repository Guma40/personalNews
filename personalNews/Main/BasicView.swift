//
//  BasicView.swift
//  personalNews
//
//  Created by Anrey on 12/9/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import UIKit

protocol TextFieldProtocol {
    func verifyEmail() -> Bool
    func verifyPass() -> Bool
    func changeFieldborger(numfield: Int)
}

class BasicView: UIView, UITextFieldDelegate, TextFieldProtocol {
   

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var massFieldmain: [UITextField] = []
    
    override func awakeFromNib() {
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        
        massFieldmain.append(emailTextfield)
        massFieldmain.append(passwordTextfield)
    }
    
// убрать выделение при вводе текста
    @IBAction func changeBorderColorTextField(_ sender: UITextField) {
        sender.setBorderColor(width: 1.0, color: .gray)
        return
    }
// скрыть клавиатуру
    @IBAction func hideKeyboard(_ sender: UITextField) {
        sender.resignFirstResponder()
        return
    }
// проверить правильность ввода адреса
    func verifyEmail() -> Bool {
       return  !(massFieldmain[0].text?.isValidEmail())! ? false : true
    }
// длинна пароля
    func verifyPass() -> Bool {
        return (massFieldmain[1].text?.count)! < passLength ? false : true
    }
// установить цвет бордюра красный
    func changeFieldborger(numfield: Int) {
        massFieldmain[numfield - 2].setBorderColor(width: 2.0, color: .red)
        massFieldmain[numfield - 2].becomeFirstResponder()
    }

}
