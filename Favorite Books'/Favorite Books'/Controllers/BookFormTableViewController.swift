//
//  BookFormTableViewController.swift
//  Favorite Books'
//
//  Created by Hunter Jensen on 10/27/23.
//

import UIKit

class BookFormTableViewController: UITableViewController {
    var book: Book?
    @IBOutlet weak var authorTextField: UITextField!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var genreTextField: UITextField!
    
    @IBOutlet weak var lengthTextField: UITextField!
    
    init?(coder: NSCoder, book: Book?) {
        self.book = book
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        self.book = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
       
    }
    func updateView() {
        if let book = book {
            print("Updating")
            titleTextField.text = book.title
            authorTextField.text = book.author
            genreTextField.text = book.genre
            lengthTextField.text = book.length
        } else {
            print("No book to update.")
        }
    }
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let title = titleTextField.text,
            let author = authorTextField.text,
            let genre = genreTextField.text,
            let length = lengthTextField.text else {return}
                
            book = Book(title: title, author: author, genre: genre, length: length)
                
                performSegue(withIdentifier: "UnwindToBookTable" , sender: self)
    }


}
