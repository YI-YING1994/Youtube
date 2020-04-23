//
//  VideoTableViewCell.swift
//  SimpleYoutube
//
//  Created by MCUCSIE on 11/6/18.
//  Copyright © 2018 MCUCSIE. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
