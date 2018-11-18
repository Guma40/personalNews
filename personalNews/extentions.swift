//
//  extentions.swift
//  personalNews
//
//  Created by Anrey on 11/4/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import Foundation
import UIKit


//расширение для строки ввода - изменение цвета бордюра
extension UITextField{
    func setBorderColor(width:CGFloat,color:UIColor) -> Void{
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}

// расширение для строки - валидация адреса email
extension String {
    func isValidEmail() -> Bool { //валидация email
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
//расширение для UIImage

extension UIImageView {
    func setFrame(radius: Int, bordW: Float, bordC: CGColor, nameImage: String) -> Void {
        if radius > 0 {      //радиус углов
            self.layer.cornerRadius = CGFloat(radius)
            self.clipsToBounds = true
        }
        if bordW > 0 {       // цвет рамки
            self.layer.borderWidth = CGFloat(bordW)
            self.layer.borderColor = bordC
        }
        if nameImage != "" {     //имя картинки для загрузки
            self.image = UIImage(named: nameImage)
        }
        return
    }
}
//-----------------
let typemessage = ["Поле email не должно быть пустыми", "Поле password не должно быть пустыми", "Неправильный формат поля ввода адреса", "Пароль меньше 6 символов", " Поля password  и password check не совпадают"]

let typeMessageError = ["First Name", "Last Name", "Email address", "Password", "Password check"]

let image_to_news = ["1-5.jpg", "3-5.jpg", "70-5.jpg", "75-5.jpg", "154-5.jpg", "176-5.jpg", "tmp-1.jpg", "tmp-2.jpg", "tmp-5.jpg", "tmp-7.jpg"]

let passLength = 6
