//
//  NewsCellTableCellControllerTableViewCell.swift
//  personalNews
//
//  Created by Anrey on 11/7/18.
//  Copyright © 2018 Anrey. All rights reserved.
//

import UIKit

class NewsCellTableController: UITableViewCell {

    @IBOutlet weak var headlineNews: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
