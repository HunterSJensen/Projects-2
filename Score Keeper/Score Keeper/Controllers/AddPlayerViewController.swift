//
//  AddPlayerViewController.swift
//  Score Keeper
//
//  Created by Hunter Jensen on 11/15/23.
//

import UIKit

import UIKit

class AddPlayerViewController: UIViewController {
    
    @IBOutlet weak var newPlayerScore: UITextField!
    @IBOutlet weak var newPlayerName: UITextField!
    var newPlayer: Player?
    override func viewDidLoad() {
            super.viewDidLoad()
        
            setupAnimatedGradientBackground()
        
        }
        
        func setupAnimatedGradientBackground() {
            // Create a CAGradientLayer
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = view.bounds
            
            // Define gradient colors
            let gradientColors: [CGColor] = [
                UIColor.red.cgColor,
                UIColor.blue.cgColor,
                UIColor.green.cgColor,
                UIColor.yellow.cgColor
            ]
            
            // Set gradient colors
            gradientLayer.colors = gradientColors
            
            // Add the gradient layer to the view's layer
            view.layer.insertSublayer(gradientLayer, at: 0)
            
            // Create a CABasicAnimation to animate the gradient start and end points
            let animation = CABasicAnimation(keyPath: "startPoint")
            animation.fromValue = NSValue(cgPoint: CGPoint(x: 0, y: 0))
            animation.toValue = NSValue(cgPoint: CGPoint(x: 1, y: 1))
            
            let endAnimation = CABasicAnimation(keyPath: "endPoint")
            endAnimation.fromValue = NSValue(cgPoint: CGPoint(x: 1, y: 1))
            endAnimation.toValue = NSValue(cgPoint: CGPoint(x: 0, y: 0))
            
            let group = CAAnimationGroup()
            group.animations = [animation]
            group.duration = 5.0 // Duration for one full loop
            group.repeatCount = .infinity
            group.autoreverses = true
            
            // Add the animation to the gradient layer
            gradientLayer.add(group, forKey: "gradientAnimation")
        }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        if let text = newPlayerScore.text, let intValue = Int(text) {
            
            newPlayer = Player(playerName: newPlayerName.text ?? " ", playerScore: intValue)
        } else { return }
        performSegue(withIdentifier: "unwind", sender: self)
        
    }
}
