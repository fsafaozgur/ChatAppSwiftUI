//
//  LoginViewModel.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 31.12.2023.
//

import Foundation
import FirebaseAuth



class LoginViewModel : ObservableObject {
    
    var username: String = ""
    var password: String = ""
    @Published var loginSuccess : Bool = false
    @Published var errorMessage: String?
    @Published var hasError : Bool = false
    
    func login() async {
        Auth.auth().signIn(withEmail: username, password: password) { [weak self] _ , error in
            if error != nil {
               self?.errorMessage = error?.localizedDescription
                self?.hasError = true
            }else {
                self?.loginSuccess = true
            }
            
        }

    }
    
    
    
    
}
