//
//  ChatView.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 17.12.2023.
//

import SwiftUI
import FirebaseAuth

struct ChatView: View {
    
    
    //In this project, we chose FireBase Firestore as a database service
    @StateObject var viewModel = ChatViewModel(service: WebService(databaseService: FireStore()))
    @State var user : UserFeature = .Receiver
    @State var hasError : Bool = false
    
    
    var body: some View {
        
        NavigationStack {
            VStack{
                
                VStack() {
                    TopArea(user: $user)
                    
                    ScrollViewReader { proxy in
                        ScrollView(){
                            ForEach(viewModel.messages, id: \.id) { message in
                                MessageBody(message: message, user: $user)
                            }
                            
                        }
                        .padding(.top)
                        .background(.white)
                        .onChange(of: viewModel.lastMessageId) { id in
                            withAnimation {
                                proxy.scrollTo(id, anchor: .bottom)
                            }
                        }
                    }
                    
                    
                }
                .background(Color("Orange"))
                
                MessageField(viewModel: viewModel, user: $user)
            }
            .onAppear(){
                Task{
                    await viewModel.getMessages()
                }
                
            }
            .alert(isPresented: $viewModel.hasError) {
                Alert(title: Text("Error!"), message: Text(self.viewModel.error?.description ?? "Some Error"), dismissButton: .default(Text("OK")))
            }

            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    NavigationLink(destination: SignoutView()) {
                        Text("Settings")
                            .foregroundColor(Color(.blue))
                    }

                }
            }
            .navigationTitle("CHAT APP")
        }
        
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
