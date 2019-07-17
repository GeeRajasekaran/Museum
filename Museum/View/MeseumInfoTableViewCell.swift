//
//  MeseumInfoTableViewCell.swift
//  Museum
//
//  Created by CVN on 16/07/19.
//  Copyright © 2019 Agiliztech. All rights reserved.
//

import UIKit

class MeseumInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLbl:UILabel!
    @IBOutlet weak var desc1Lbl:UILabel!
    @IBOutlet weak var imgView:UIImageView!
    @IBOutlet weak var imgView2:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var detailInfo: Floorinfo! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        
        self.infoLbl.text = detailInfo.name
        self.desc1Lbl.text = detailInfo.desc
        self.imgView.image = detailInfo.img1
        self.imgView2.image = detailInfo.img2
        
        imgView.layer.cornerRadius = 8.0
        imgView.layer.masksToBounds = true
        imgView2.layer.cornerRadius = 8.0
        imgView2.layer.masksToBounds = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
