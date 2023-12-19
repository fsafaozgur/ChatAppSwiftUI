//
//  ChatAppSwiftUIApp.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 17.12.2023.
//

import SwiftUI
import Firebase

@main
struct ChatAppSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ChatView()
        }
    }
}
