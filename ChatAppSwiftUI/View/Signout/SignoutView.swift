//
//  SignoutView.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 31.12.2023.
//

import SwiftUI
import FirebaseAuth

struct SignoutView: View {
    
    @State var isSuccess: Bool = false

    var body: some View {
        
        NavigationStack{
                       
            VStack(){
                                  
                    NavigationLink(destination: HomeView()
                        .navigationBarBackButtonHidden(true), isActive: $isSuccess) {
                            Button {
                                do{
                                    try Auth.auth().signOut()
                                    isSuccess = true
                                }catch{
                                    print("DEBUG: Sign Out error")
                                }
                            } label: {
                                Text("SignOut")
                                    .padding()
                                    .foregroundColor(Color(.white))
                                    .background(Color(.blue))
                                
                            }
                        }
            
                }
                .navigationTitle("SETTINGS")

        }
        

    }
}

struct SignoutView_Previews: PreviewProvider {
    static var previews: some View {
        SignoutView()
    }
}
