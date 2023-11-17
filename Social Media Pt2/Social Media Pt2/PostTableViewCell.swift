//
//  PostTableViewCell.swift
//  Social Media Pt2
//
//  Created by Hunter Jensen on 11/9/23.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
