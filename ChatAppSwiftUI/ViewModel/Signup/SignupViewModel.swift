//
//  SignupViewModel.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 1.01.2024.
//

import Foundation
import FirebaseAuth

class SignupViewModel : ObservableObject {
    
    var username: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    @Published var signupSuccess: Bool = false
    @Published var errorMessage: String?
    @Published var hasError : Bool = false
    
    
    func signupUser() async {
        
            
        if username != "", password != "" {
            
            if password == confirmPassword {
                
                do{
                    try await Auth.auth().createUser(withEmail: username, password: password)
                    await MainActor.run {
                        self.signupSuccess = true
                    }
                }catch{
                    await MainActor.run {
                        self.hasError = true
                        self.errorMessage = error.localizedDescription
                        self.signupSuccess = false
                    }
                }
            }else {
                await MainActor.run {
                    self.hasError = true
                    self.errorMessage = "Password Confirmation Error"
                    self.signupSuccess = false
                }
            }
        }else {
            await MainActor.run {
                self.hasError = true
                self.errorMessage = "Please enter valid username and password"
                self.signupSuccess = false
            }
            
        }
    }
    
}
