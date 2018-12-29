//
//  GzpageTableViewCell.swift
//  ShiXun
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 lilu. All rights reserved.
//

import UIKit

class GzpageTableViewCell: UITableViewCell {
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var userName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
