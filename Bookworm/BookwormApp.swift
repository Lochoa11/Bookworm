//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Lin Ochoa on 1/12/25.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
