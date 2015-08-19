//
//  AutoActsTableViewCell.swift
//  MDTester
//
//  Created by Irene Hwang on 8/4/15.
//  Copyright (c) 2015 Irene Hwang. All rights reserved.
//

import UIKit

class AutoActsTableViewCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var volUpImageView: UIImageView!
    @IBOutlet weak var volDownImageView: UIImageView!
    @IBOutlet weak var powerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
