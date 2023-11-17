//
//  AthleteDetailsViewController.swift
//  FavoriteAthlete
//
//  Created by Hunter Jensen on 10/12/23.
//

import UIKit

class AthleteDetailsViewController: UIViewController {
    init?(coder: NSCoder, athlete: Athlete?) {
        super.init(coder: coder)
        theAthlete = athlete
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!

    var theAthlete: Athlete?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        
    }
    
    
    func update() {
        if let theAthlete = theAthlete {
            nameTextField.text = theAthlete.name
            ageTextField.text = theAthlete.age
            leagueTextField.text = theAthlete.league
            teamTextField.text = theAthlete.team
        }
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        let theAthlete = Athlete(name: nameTextField.text!, league: leagueTextField.text!, age: ageTextField.text!, team: teamTextField.text!)
        self.theAthlete = theAthlete
        performSegue(withIdentifier: "unwind", sender: self)
    }
    

}
