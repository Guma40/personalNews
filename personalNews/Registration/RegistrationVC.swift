//
//  RegistrationVC.swift
//  personalNews
//
//  Created by Anrey on 11/4/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import UIKit

class RegistrationVC: BaseViewController {

    @IBOutlet weak var scroolView: UIScrollView!
    
    var viewRegField : TextFieldProtocol {
            return self.view as! ViewRegistration }
    
    var kodError = 0
    
    
// - - - - - - - - -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    }
    
 //вызов окна с указанием ошибки и изм. цвета бордюра
    func visibleWindowAlert(_ kod: Int, typeMes: Bool, _ fieldnum: Int) {
        allertMessage(kod, err: typeMes)
        viewRegField.changeFieldborger(numfield: fieldnum)
      return
    }
    
// нажатие кнопки save
// проверка на правильность введения информации
    @IBAction func saveButton(_ sender: UIButton) {
        kodError = viewRegField.massFieldmain.checkFieldnotEmply()
        if  kodError != 0 {    //пустые строки
            visibleWindowAlert(kodError-1, typeMes: false, kodError-1)
            return
        }
        if  !InputAnalizerManeger.analizeInputText((viewRegField.massFieldmain[2].text)!, type: .email) {
            visibleWindowAlert(0, typeMes: true, 2)
            return
        }
        if !InputAnalizerManeger.analizeInputText((viewRegField.massFieldmain[3].text)!, type: .pass) {
            visibleWindowAlert(1, typeMes: true, 3)
            return
        }
        if !InputAnalizerManeger.comparePass((viewRegField.massFieldmain[3].text)!, viewRegField.massFieldmain[4].text!) {
            visibleWindowAlert(2, typeMes: true, 4)
            return

        }
        
        //открыть окно с подвтерждением регистрации
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let windowsOkVC = mainStoryboard.instantiateViewController(withIdentifier: "windowsOk") as! windowOkController
                self.present(windowsOkVC, animated:true, completion:nil)
    
        return
    }
    
}
