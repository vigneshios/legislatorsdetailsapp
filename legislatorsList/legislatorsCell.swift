//
//  legislatorsCell.swift
//  legislatorsList
//
//  Created by vignesh on 6/20/17.
//  Copyright © 2017 vignesh. All rights reserved.
//

import UIKit

class legislatorsCell: UITableViewCell {

    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var partyName: UILabel!
    
    
    @IBOutlet weak var titleName: UILabel!
    
    @IBOutlet weak var phonenumberlabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
