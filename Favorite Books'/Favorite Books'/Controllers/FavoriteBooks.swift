//
//  FavoriteBooks.swift
//  Favorite Books'
//
//  Created by Hunter Jensen on 10/27/23.
//

import Foundation

struct Book: CustomStringConvertible {
    var title: String
    var author: String
    var genre: String
    var length: String
    
    var description: String {
        return "\(title) is written by \(author) in the \(genre) genre and is \(length) pages long"
    }
}
