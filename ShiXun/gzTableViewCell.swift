//
//  gzTableViewCell.swift
//  ShiXun
//
//  Created by 邱洁琳 on 2018/12/29.
//  Copyright © 2018 lilu. All rights reserved.
//

import UIKit

class gzTableViewCell: UITableViewCell {
    @IBOutlet weak var gzLabel: UILabel!
    @IBOutlet weak var gzImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}