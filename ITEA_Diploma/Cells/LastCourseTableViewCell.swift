//
//  LastCourseTableViewCell.swift
//  ITEA_Diploma
//
//  Created by Alex Marfutin on 5/30/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class LastCourseTableViewCell: UITableViewCell {
    
    @IBOutlet var lastCourseImage: UIImageView!
    @IBOutlet var lastCourseNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
