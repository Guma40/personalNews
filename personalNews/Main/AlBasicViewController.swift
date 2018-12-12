//
//  AlBasicViewController.swift
//  personalNews
//
//  Created by Anrey on 11/2/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import UIKit


class AlBasicViewController: UIViewController {
    
    @IBOutlet weak var velcomeImage: UIImageView!
    
    var viewtextField:  TextFieldProtocol {
        return self.view as! BasicView }
    
    
    //--------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
       
        //цвета
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        velcomeImage.setFrame(radius: 20, bordW: 1.0, bordC: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), nameImage: "img.Images_Pic_tmp-3")
   }
    
    // MARK: - Navigation
    
    
// сообщение об ошибке ввода
    func allertMessage(nummessage: Int) {
        let allertController = UIAlertController(title: "Error", message: typemessage[nummessage], preferredStyle: UIAlertController.Style.alert)
        allertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        viewtextField.changeFieldborger(numfield: nummessage)
        
        self.present(allertController, animated: true, completion: nil)
        return
    }
    
// кнопка Ок
// проверка условий заполнения полей
// если все ОК - переход на главную страницу
    @IBAction func enterOkButton(_ sender: Any) {
    
        if !(viewtextField.verifyEmail()) {
            allertMessage(nummessage: 2)
            return
        }
        if !(viewtextField.verifyPass()) {
            allertMessage(nummessage: 3)
            return
        }
        return
   }
    

}


