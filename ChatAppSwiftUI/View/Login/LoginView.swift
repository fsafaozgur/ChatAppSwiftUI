//
//  LoginView.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 31.12.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel : LoginViewModel = LoginViewModel()
    
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

                    
                    NavigationLink(destination: ChatView()
                        .navigationBarBackButtonHidden(true), isActive: $viewModel.loginSuccess) {
                            Button {
                                Task{
                                    await viewModel.login()
                                }
                            } label: {
                                Text("Login")
                                    .frame(width: 75, height: 30)
                                    .background(Color(.blue))
                                    .foregroundColor(Color(.white))
                            }
                            .padding()
                        }
                    
                    
                    
                    
                    NavigationLink(destination: SignupView()) {
                        Text("Not already have an account? Sign up now")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                            .padding()
                    }
                    
                    Spacer()
                    
                    
                }
                .padding()
                .ignoresSafeArea(.all)
                .background(Color.loginBackground)
                .navigationTitle("CHAT APP LOGIN")
                
            }
            .alert(isPresented: $viewModel.hasError) {
                Alert(title: Text("Error!"), message: Text(self.viewModel.errorMessage ?? "Some Error"), dismissButton: .default(Text("OK")))
            }

        

    }

    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
