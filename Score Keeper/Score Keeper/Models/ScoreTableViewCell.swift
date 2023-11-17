//
//  ScoreTableViewCell.swift
//  Score Keeper
//
//  Created by Hunter Jensen on 11/13/23.
//

import UIKit
protocol ScoreTableViewCellDelegate: AnyObject {
    func stepperValueChanged(in cell: ScoreTableViewCell, newValue: Double)
}


class ScoreTableViewCell: UITableViewCell {

    weak var delegate: (ScoreTableViewCellDelegate)?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreCounter: UIStepper!
    @IBOutlet weak var playerImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateScore() {
        scoreLabel.text = "\(Int(scoreCounter.value))"
    }
    
    
    @IBAction func counterPressed(_ sender: UIStepper) {
        delegate?.stepperValueChanged(in: self, newValue: sender.value)
        updateScore()
        
        
    }
}
