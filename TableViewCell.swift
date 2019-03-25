//
//  TableViewCell.swift
//  userRegistrationAndLogin
//
//  Created by MOSHIOUR on 10/1/18.
//  Copyright © 2018 moshiour. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var capitalName: UILabel!
    //@IBOutlet weak var capitalLabel: UILabel!
    
    //@IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
