import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
    }

    var athletes: [Athlete] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }

    
    @IBSegueAction func addAthlete(_ coder: NSCoder, sender: Any?) -> AthleteDetailsViewController? {
        return AthleteDetailsViewController(coder: coder, athlete: nil)
    }
    
    
    @IBSegueAction func editAthlete(_ coder: NSCoder, sender: Any?) -> AthleteDetailsViewController? {
        
        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {return nil}
            let theAthlete1 = athletes[indexPath.row]
        
        return AthleteDetailsViewController(coder: coder, athlete: theAthlete1)
    }
    @IBAction func unwindToAthleteTableViewController(_ segue: UIStoryboardSegue) {
        guard let detailedViewController = segue.source as? AthleteDetailsViewController,
              let theAthlete = detailedViewController.theAthlete else {
            return
        }
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            athletes[selectedIndexPath.row] = theAthlete
        } else {
            athletes.append(theAthlete)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = athlete.name
        content.secondaryText = "AGE: \(athlete.age), TEAM: \(athlete.team), LEAGUE: \(athlete.league)"
        
        cell.contentConfiguration = content
        
        return cell
    }
}
