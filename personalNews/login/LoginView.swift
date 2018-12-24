//
//  BasicView.swift
//  personalNews
//
//  Created by Anrey on 12/9/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import UIKit


class BasicView: FirstView, UITextFieldDelegate {
   
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    override func awakeFromNib() {
        super .awakeFromNib()
        
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        
        massFieldmain.append(emailTextfield)
        massFieldmain.append(passwordTextfield)
    }
}
