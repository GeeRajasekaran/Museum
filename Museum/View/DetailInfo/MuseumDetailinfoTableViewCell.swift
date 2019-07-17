//
//  MuseumDetailinfoTableViewCell.swift
//  Museum
//
//  Created by CVN on 16/07/19.
//  Copyright © 2019 Agiliztech. All rights reserved.
//

import UIKit

class MuseumDetailinfoTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var detailInfo: FloorDetail! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        imgView.image = detailInfo.img
        imgView.layer.cornerRadius = 8.0
        imgView.layer.masksToBounds = true
        
        self.accessoryType = .none
        if detailInfo.seenStatus {
            self.accessoryType = .checkmark
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
