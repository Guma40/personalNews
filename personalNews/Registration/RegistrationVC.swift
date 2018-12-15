//
//  RegistrationVC.swift
//  personalNews
//
//  Created by Anrey on 11/4/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController {

    @IBOutlet weak var scroolView: UIScrollView!
    
    var viewRegField : viewRegistrationProtocol {
            return self.view as! ViewRegistration }
    
    var kodError = 0
    
    
// - - - - - - - - -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    }
// сообщение об ошибке ввода
    func allertErrorTextField(err: Bool, nummessage: String, numfield: Int) {
        if err {
        let allertController = UIAlertController(title: "Error", message: nummessage, preferredStyle: UIAlertController.Style.alert)
        allertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
       viewRegField.changeFieldborger(numfield: numfield)
            
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
    
// нажатие кнопки save
// проверка на правильность введения информации
    @IBAction func saveButton(_ sender: UIButton) {
        kodError = checkFieldnotEmply()
        if  kodError != 0 {
            allertErrorTextField(err: true, nummessage: "Поле \(typeMessageError[kodError - 1]) не должно быть пустым", numfield: kodError-1)
        } else {
          // проверить на правильность ввода информации
            kodError = checkValidInform()
            if  kodError != 0 {
                allertErrorTextField(err: true, nummessage: typemessage[kodError], numfield: kodError)
            } else {
              //открыть окно с подвтерждением регистрации
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let windowsOkVC = mainStoryboard.instantiateViewController(withIdentifier: "windowsOk") as! windowOkController
                self.present(windowsOkVC, animated:true, completion:nil)
            }
        }
        return
    }
    
}
