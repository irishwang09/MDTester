//
//  contactCell.swift
//  MDTester
//
//  Created by Irene Hwang on 8/3/15.
//  Copyright (c) 2015 Irene Hwang. All rights reserved.
//

import UIKit

class contactCell: UITableViewCell {

    @IBOutlet weak var cellNameLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
