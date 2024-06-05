//
//  Book.swift
//  iCharts
//
//  Created by Yery Castro on 28/5/24.
//

import Foundation

struct Book: Identifiable, Equatable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.id == rhs.id
    }
    
    let id = UUID()
    let title: String
    let author: Author
    let category: BookCategory
    let price: Double
    let inventoryCount: Int
    
    static var example = Book(title: "Harry Potter and the Sorcerer's Stone",
                              author: Author.examples[0],
                              category: .fiction,
                              price: 19.99,
                              inventoryCount: 100)
    
    static var examples =  [
        Book(title: "Harry Potter and the Sorcerer's Stone", author: Author.examples[0], category: .fiction, price: 19.99, inventoryCount: 100),
        Book(title: "The Lord of the Rings", author: Author.examples[1], category: .fiction, price: 25.99, inventoryCount: 85),
        Book(title: "To Kill a Mockingbird", author: Author.examples[2], category: .fiction, price: 15.99, inventoryCount: 70),
        Book(title: "1984", author: Author.examples[3], category: .fiction, price: 14.99, inventoryCount: 80),
        Book(title: "The Catcher in the Rye", author: Author.examples[4], category: .fiction, price: 12.99, inventoryCount: 60),
        Book(title: "Charlotte's Web", author: Author.examples[5], category: .children, price: 15.99, inventoryCount: 85),
        Book(title: "The Very Hungry Caterpillar", author: Author.examples[6], category: .children, price: 10.99, inventoryCount: 90),
        Book(title: "Where the Wild Things Are", author: Author.examples[7], category: .children, price: 13.99, inventoryCount: 85),
        Book(title: "Green Eggs and Ham", author: Author.examples[8], category: .children, price: 9.99, inventoryCount: 80),
        Book(title: "The Cat in the Hat", author: Author.examples[9], category: .children, price: 9.99, inventoryCount: 80),
        Book(title: "The Steve Jobs Way", author: Author.examples[2], category: .business, price: 14.99, inventoryCount: 50),
        Book(title: "The Innovator's Dilemma", author: Author.examples[1], category: .business, price: 15.99, inventoryCount: 45),
        Book(title: "Lean In", author: Author.examples[3], category: .business, price: 14.99, inventoryCount: 55),
        Book(title: "Eloquent JavaScript", author: Author.examples[0], category: .computerScience, price: 29.99, inventoryCount: 40),
        Book(title: "Introduction to the Theory of Computation", author: Author.examples[4], category: .computerScience, price: 49.99, inventoryCount: 35),
        Book(title: "The Great Gatsby", author: Author.examples[5], category: .fiction, price: 14.99, inventoryCount: 75),
        Book(title: "The Grapes of Wrath", author: Author.examples[6], category: .fiction, price: 14.99, inventoryCount: 65),
        Book(title: "Moby Dick", author: Author.examples[7], category: .fiction, price: 19.99, inventoryCount: 55),
        Book(title: "Pride and Prejudice", author: Author.examples[8], category: .fiction, price: 9.99, inventoryCount: 70),
        Book(title: "The Giving Tree", author: Author.examples[9], category: .children, price: 10.99, inventoryCount: 85)
    ]
}
