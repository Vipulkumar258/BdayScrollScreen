//
//  PersonsTableCell.swift
//  BdayScrollScreen
//
//  Created by Appinventiv on 23/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class PhoneContactsTableCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personContactNumber: UILabel!
    @IBOutlet weak var selectionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        profileImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
