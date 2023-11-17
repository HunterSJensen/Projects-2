//
//  ScoreListTableViewController.swift
//  Score Keeper
//
//  Created by Hunter Jensen on 11/13/23.
//

import UIKit


extension ScoreListTableViewController: ScoreTableViewCellDelegate {
    func stepperValueChanged(in cell: ScoreTableViewCell, newValue: Double) {
        if let indexPath = tableView.indexPath(for: cell) {
            let newScore = Int(newValue)
            players[indexPath.row].playerScore = newScore
            sortPlayersByScore()
        }
    }
}


class ScoreListTableViewController: UITableViewController {

    var players: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sortPlayersByScore()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! ScoreTableViewCell

        
        cell.delegate = self
        let player = players[indexPath.row]
        cell.nameLabel.text = player.playerName
        cell.scoreLabel.text = String(player.playerScore)
        cell.scoreCounter.value = Double(player.playerScore)
        

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        
        }
    }
    


    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        guard let source = segue.source as? AddPlayerViewController,
              let newPlayer = source.newPlayer else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow {
            players[indexPath.row] = newPlayer
        } else {
            players.append(newPlayer)
                           
                    

        }
        sortPlayersByScore()
        tableView.reloadData()
    }

    func sortPlayersByScore() {
            players.sort { $0.playerScore > $1.playerScore }
            tableView.reloadData()
        }

}
