//
//  PostDetailViewController.swift
//  Social Media Pt2
//
//  Created by Hunter Jensen on 11/9/23.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var postUserAndDateLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postLikeCountLabel: UILabel!
    @IBOutlet weak var postCommentsLabel: UILabel!
    
    
    var post: Post
    
    init?(coder: NSCoder, post: Post) {
        self.post = post
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView2.image = UIImage(named: post.image ?? "Post 1")
        postUserAndDateLabel.text = "\(post.user) - \(post.date) - \(post.title)"
        postTitleLabel.text = "\(post.user): \(post.bodyText)"
        postLikeCountLabel.text = "❤️  \(post.likes)"
        postCommentsLabel.text = "\(post.comments)"
    }
    
}
