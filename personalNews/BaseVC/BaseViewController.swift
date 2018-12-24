//
//  BaseViewController.swift
//  personalNews
//
//  Created by Anrey on 12/20/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    let typemessage = ["Неправильный формат поля ввода адреса", "Пароль меньше 6 символов", " Поля password  и password check не совпадают"]
    
    let typeMessageError = ["First Name", "Last Name", "Email address", "Password", "Password check"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    
// сообщение об ошибке ввода
    func allertMessage(_ nummessage: Int, err: Bool) {
        var newMessage = ""
        if err {
            newMessage = typemessage[nummessage]
        } else {
            newMessage = "Поле \(typeMessageError[nummessage]) не должно быть пустым"
        }
        let allertController = UIAlertController(title: "Error", message: newMessage, preferredStyle: UIAlertController.Style.alert)
        allertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(allertController, animated: true, completion: nil)
        return
    }
    
 
}
