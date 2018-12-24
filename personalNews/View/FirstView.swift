//
//  FirstView.swift
//  personalNews
//
//  Created by Anrey on 12/20/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import UIKit

protocol TextFieldProtocol {
    func changeFieldborger(numfield: Int)
    var massFieldmain: [UITextField] {get set}
}

class FirstView: UIView, TextFieldProtocol {
    
    var massFieldmain: [UITextField] = []
   
    override func awakeFromNib() {
        if massFieldmain.count > 0 {
                massFieldmain.removeAll()
        }
    }
    
// установить цвет бордюра красный
    func changeFieldborger(numfield: Int) {
        massFieldmain[numfield].setBorderColor(width: 2.0, color: .red, setCursor: true)
        massFieldmain[numfield].becomeFirstResponder()
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
    

}
