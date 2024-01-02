//
//  HomeView.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 31.12.2023.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    
    var body: some View {

        if Auth.auth().currentUser != nil {
            ChatView()
        }else {
            LoginView()
        }
    }

}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
