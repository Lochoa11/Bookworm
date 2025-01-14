//
//  AddBookView.swift
//  Bookworm
//
//  Created by Lin Ochoa on 1/13/25.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Unknown"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller", "Unknown"]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Authors's Name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                    .disabled(validations())
                }
            }
            .navigationTitle("Add Book")
        }
    }
    
    func validations() -> Bool {
        if title.isReallyEmpty ||
            author.isReallyEmpty ||
            review.isReallyEmpty {
            return true
        }
        if genre == "Unknown" {
            return true
        }
        return false
     }
}

#Preview {
    AddBookView()
}
