//
//  ArticleTableViewCell.swift
//  koml_machinetest
//
//  Created by Script Lanes on 09/03/20.
//  Copyright © 2020 Script Lanes. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
