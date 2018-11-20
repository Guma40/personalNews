//
//  AlBasicViewController.swift
//  personalNews
//
//  Created by Anrey on 11/2/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import UIKit


class AlBasicViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var velcomeImage: UIImageView!
    

//--------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        //self.navigationController?.view.backgroundColor = UIColor.clear
        
        //цвета
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        emailTextField.setBorderColor(width: 1.0, color: .gray)
        passwordTextField.setBorderColor(width: 1.0, color: .gray)
        
        velcomeImage.setFrame(radius: 20, bordW: 1.0, bordC: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), nameImage: "img.Images_Pic_tmp-3")
   }
    
    // MARK: - Navigation
    
// убрать выделение при вводе текста
    @IBAction func changeEmailadrress(_ sender: UITextField) {
        emailTextField.setBorderColor(width: 1.0, color: .gray)
        return
    }
    
    @IBAction func changePasswordfield(_ sender: UITextField) {
        passwordTextField.setBorderColor(width: 1.0, color: .gray)
        return
    }
// скрыть клавиатуру
    @IBAction func hideKeyboard(_ sender: UITextField) {
        sender.resignFirstResponder()
        return
    }
    
// сообщение об ошибке ввода
    func allertMessage(nummessage: Int, field : UITextField) {
        let allertController = UIAlertController(title: "Error", message: typemessage[nummessage], preferredStyle: UIAlertController.Style.alert)
        allertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        field.setBorderColor(width: 1.0, color: .red)
        field.becomeFirstResponder()
        self.present(allertController, animated: true, completion: nil)
        return
    }
    
// кнопка Ок
// проверка условий заполнения полей
// если все ОК - переход на главную страницу
    @IBAction func enterOkButton(_ sender: Any) {
    
        if !(emailTextField?.text?.isValidEmail())! {
            allertMessage(nummessage: 2, field: emailTextField)
            return
        }
        if (passwordTextField?.text?.count)! < passLength {
            allertMessage(nummessage: 3, field: passwordTextField)
            return
        }
        return
   }
    

}


