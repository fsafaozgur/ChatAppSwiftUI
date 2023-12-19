//
//  ChatView.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 17.12.2023.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject var viewModel = ChatViewModel()
    @State var user : UserFeature = .Receiver
    @State var hasError : Bool = false
    
    
    var body: some View {
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
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
