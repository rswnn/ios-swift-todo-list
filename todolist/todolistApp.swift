//
//  todolistApp.swift
//  todolist
//
//  Created by riswan on 05/06/21.
//

import SwiftUI
import Firebase

@main
struct todolistApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContactView()
        }
    }
}
