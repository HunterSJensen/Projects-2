//
//  BookTableViewController.swift
//  Favorite Books'
//
//  Created by Hunter Jensen on 10/27/23.
//

import UIKit

class BookTableViewController: UITableViewController {
    var books: [Book] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        guard let source = segue.source as? BookFormTableViewController,
              let book = source.book else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow {
            books[indexPath.row] = book
        } else {
            books.append(book)
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell
        
        let book = books[indexPath.row]
        cell.update(with: book)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBSegueAction func editBook(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> BookFormTableViewController? {
        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        let book = books[indexPath.row]
        
        return BookFormTableViewController(coder: coder, book: book)
    }
    @IBSegueAction func editBook2(_ coder: NSCoder, sender: Any?) -> BookFormTableViewController? {
        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        let book = books[indexPath.row]
        
        return BookFormTableViewController(coder: coder, book: book)
    }
}
