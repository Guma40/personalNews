//
//  NewsViewController.swift
//  personalNews
//
//  Created by Anrey on 11/6/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var numpage: Int = 0
    
    @IBOutlet weak var switchNews: UISegmentedControl!
    
    @IBOutlet weak var newsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 //действия по кнопке переключателя
    @IBAction func swithcNewsAction(_ sender: UISegmentedControl) {
        numpage = sender.selectedSegmentIndex
        newsTable.reloadData()
        return
    }
    
    
    // MARK: - Navigation
     
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return image_to_news.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellNews = tableView.dequeueReusableCell(withIdentifier: "cellNews", for: indexPath) as! NewsCellTableController
        
        cellNews.imageNews?.setFrame(radius: 20, bordW: 0, bordC: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), nameImage: image_to_news[indexPath.row])
        
        switch numpage {
        case 0:
            cellNews.headlineNews?.text = "News to day  - number \(indexPath.row)"
        case 1:
            cellNews.headlineNews?.text = "Самые главные новости - number \(indexPath.row)"
        default:
            break
        }
        return cellNews
     }
    
}
