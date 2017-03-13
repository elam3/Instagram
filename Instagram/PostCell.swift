//
//  PostCell.swift
//  Instagram
//
//  Created by Edison Lam on 3/11/17.
//  Copyright © 2017 Edison Lam. All rights reserved.
//

import UIKit
import ParseUI

class PostCell: UITableViewCell {

    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    
    var post: Post! {
        didSet {
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
