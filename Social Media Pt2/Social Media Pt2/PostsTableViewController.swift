//
//  PostsTableViewController.swift
//  Social Media Pt2
//
//  Created by Hunter Jensen on 11/9/23.
//

import UIKit

class PostsTableViewController: UITableViewController {
    var myPosts: [Post] = [
        Post(title: "Welcome To France!", bodyText: "It is sooooo colorful!!!", date: "10/22/2023", likes: "1,024", image: "Post 1", user: "Hunter", comments:"Josh: Luv \nMegan: Dreammmmy \nParker: I saw you!"),
        Post(title:"Welcome To Greece!", bodyText: "I love This!", date: "10/22/2023", likes: "1,543", image: "Post 2", user: "Hunter", comments: "Josh: Luv \nMegan: Dreammmmy \nParker: I saw you!"),
        Post(title: "Nature :)", bodyText: "This mountain is were I grew up <3", date: "7/02/2023", likes: "1,636", image: "Post 3", user: "Hunter", comments: "Josh: Luv \nMegan: Dreammmmy \nParker: I saw you!"),
        Post(title: "The DUNESSSS", bodyText: "Had so much fun out here today! I dont wanna leave :(", date: "4/23/2023", likes: "1,743", image: "Post 4", user: "Hunter", comments: "Josh: Luv \nMegan: Dreammmmy \nParker: I saw you!"),
        Post(title: "The Calm After The Storm", bodyText: "Had so much fun out on the water and taking these awesome pictures!", date: "2/01/2023", likes: "1,234", image: "Post 5", user: "Hunter", comments: "Josh: Luv \nMegan: Dreammmmy \nParker: I saw you!"),
        Post(title: "Beats The Cold!", bodyText: "Escaped the cold today haha!", date: "1/22/2023", likes: "1,653", image: "Post 6", user: "Hunter", comments: "Josh: Luv \nMegan: Dreammmmy \nParker: I saw you!"),
        Post(title: "Surfs Up!", bodyText: "Amazing pictue I took of my wife while at the beach!", date: "12/05/2022", likes: "1,736", image: "Post 7", user: "Hunter", comments: "Josh: Luv \nMegan: Dreammmmy \nParker: I saw you!"),
        Post(title: "Fight! Fight! Fight!", bodyText: "I would be lying if I said I wasn't scared!", date: "11/10/2022", likes: "1,354", image: "Post 8", user: "Hunter", comments: "Josh: Luv \nMegan: Dreammmmy \nParker: I saw you!"),
        Post(title: "Cute Village", bodyText: "Can I live in this house!", date: "10/22/2022", likes: "1,545", image: "Post 9", user: "Hunter", comments: "Josh: Luv \nMegan: Dreammmmy \nParker: I saw you!"),
        Post(title: "Morning!", bodyText: "Love my view when I wake up!", date: "10/01/2022", likes: "1,673", image: "Post 10", user: "Hunter", comments: "Josh: Luv \nMegan: Dreammmmy \nParker: I saw you!"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myPosts.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        let singlePosts = myPosts[indexPath.row]
        
        cell.imageView1.image = UIImage(named: singlePosts.image ?? "Post 1")
        cell.imageView1.layer.cornerRadius = 50
        cell.captionLabel.text = singlePosts.bodyText
        cell.likesLabel.text = "Likes: \(singlePosts.likes)"
        cell.postDateLabel.text = singlePosts.date
        cell.postTitleLabel.text = singlePosts.title
        
        return cell
    }
    @IBSegueAction func detailSegue(_ coder: NSCoder, sender: Any?) -> PostDetailViewController? {
        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else { return nil }
        let selectedPost = myPosts[indexPath.row]

        let detail = PostDetailViewController(coder: coder, post: selectedPost)
        return detail
    }
    
//    @IBSegueAction func toDetailed(_ coder: NSCoder, sender: Any?) -> UINavigationController? {
//        let navigationController = UINavigationController(coder: coder)
//        let detailController = navigationController?.viewControllers.first as? PostDetailViewController
//        
//        guard let detailController = detailController else {
//            return UINavigationController(coder: coder)
//        }
//        
//        guard let cell = sender as? UITableViewCell,
//              let indexPath = tableView.indexPath(for: cell) else {
//            return navigationController
//        }
//        
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        detailController.thePosts = myPosts[indexPath.row]
//        return navigationController
//    }
}
