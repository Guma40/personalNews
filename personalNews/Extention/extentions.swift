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
extension UITextField {
    func setBorderColor(width:CGFloat,color:UIColor, setCursor: Bool) -> Void{
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
            if setCursor {
                self.becomeFirstResponder()
            }
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
// проверка на пустые строки
extension Array where Element : UITextField {
    
    func checkFieldnotEmply() -> Int {
        for field in self {
            if (field.text)!.isEmpty {
                return field.tag
            }
        }
        return 0
    }
}

//анализ введенной информации
class InputAnalizerManeger {
   
    enum InputType: Int {
        case firstname, lastname, email, pass, chpass
    }
    
    class func analizeInputText(_ text: String, type: InputType)->Bool {
        let passLength = 6
        
        switch type {
        case .email:
            return text.isValidEmail()
        case .pass:
            return text.count < passLength ? false : true
        case .firstname, .lastname:
            return text.isEmpty
        default:
            return true
        }
    }
    class  func comparePass(_ pass: String, _ chpass: String) ->Bool {
        return pass == chpass ? true : false
    
    }
}

