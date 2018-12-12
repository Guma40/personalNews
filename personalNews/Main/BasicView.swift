//
//  BasicView.swift
//  personalNews
//
//  Created by Anrey on 12/9/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import UIKit

protocol TextFieldProtocol {
    func changeFieldborger(numfield: Int)
}

class BasicView: UIView, UITextFieldDelegate, TextFieldProtocol {
   

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    override func awakeFromNib() {
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        
        if massFieldmain.count > 0 {
                massFieldmain.removeAll()
        }
                massFieldmain.append(emailTextfield)
                massFieldmain.append(passwordTextfield)
        
    }
    
// убрать выделение при вводе текста
    @IBAction func changeBorderColorTextField(_ sender: UITextField) {
        sender.setBorderColor(width: 1.0, color: .gray, setCursor: false)
        return
    }
// скрыть клавиатуру
    @IBAction func hideKeyboard(_ sender: UITextField) {
        sender.resignFirstResponder()
        return
    }
    
// установить цвет бордюра красный
    func changeFieldborger(numfield: Int) {
        massFieldmain[numfield].setBorderColor(width: 2.0, color: .red, setCursor: true)
    }

}
