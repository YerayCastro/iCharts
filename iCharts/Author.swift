//
//  Author.swift
//  iCharts
//
//  Created by Yery Castro on 28/5/24.
//

import Foundation

struct Author: Identifiable {
    let id = UUID()
    let name: String
    
    static var example = Author(name: "George R. R. Martin")
    static var examples = [
        Author(name: "J.K. Rowling"),
        Author(name: "Geroge R. R. Martin"),
        Author(name: "J.R.R. Tolkien"),
        Author(name: "Stephen King"),
        Author(name: "Agatha Cristie"),
        Author(name: "Dan Brown"),
        Author(name: "Harper Lee"),
        Author(name: "Jane Austen"),
        Author(name: "F. Scott Fitzgerald"),
        Author(name: "Ernest Hemingway")
    ]
}
