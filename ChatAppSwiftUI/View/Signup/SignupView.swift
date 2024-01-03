//
//  SignupView.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 31.12.2023.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject var viewModel : SignupViewModel = SignupViewModel()
    @State var buttonDisable : Bool = true
    
    var body: some View {
        
        NavigationStack{
                        
                VStack(alignment: .center){
                    
                    Spacer()
                    

                    
                    TextField("Email", text: $viewModel.username)
                        .padding()
                        .autocapitalization(.none)
                        .background(Color(.white))
                    
                    
                    TextField("Password", text: $viewModel.password)
                        .padding()
                        .autocapitalization(.none)
                        .background(Color(.white))
                    
                    
                    TextField("Confirm Password", text: $viewModel.confirmPassword)
                        .padding()
                        .autocapitalization(.none)
                        .background(Color(.white))
                    
                    NavigationLink(destination: HomeView()
                        .navigationBarBackButtonHidden(true), isActive: $viewModel.signupSuccess) {
                            Button {
                                Task{
                                    await viewModel.signupUser()
                                }
                            } label: {
                                Text("Sign Up")
                                    .frame(width: 75, height: 30)
                                    .background(Color(.blue))
                                    .foregroundColor(Color(.white))
                            }
                            .padding()
                        }
                            
                    Spacer()
                    
                }
                .padding()
                .ignoresSafeArea(.all)
                .background(Color.signUpBackground)
                .navigationTitle("Create New Account")
                
            }
            .alert(isPresented: $viewModel.hasError) {
                Alert(title: Text("Error!"), message: Text(self.viewModel.errorMessage ?? "Some Error"), dismissButton: .default(Text("OK")))
            }

        
        
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
