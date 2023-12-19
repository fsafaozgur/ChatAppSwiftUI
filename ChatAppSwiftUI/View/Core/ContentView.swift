//
//  ContentView.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 17.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var messageService = WebService()
    @State var user : UserFeature = .Receiver
    
    var body: some View {
        VStack{
            
            VStack() {
                TopArea(user: $user)
                
                ScrollViewReader { proxy in
                    ScrollView(){
                        ForEach(messageService.messages, id: \.id) { message in
                            MessageBody(message: message, user: $user)
                        }
                        
                    }
                    .padding(.top)
                    .background(.white)
                    .onChange(of: messageService.lastMessageId) { id in
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                    .onAppear(){
                        proxy.scrollTo(messageService.lastMessageId, anchor: .bottom)
                    }
                    
                }

                
            }
            .background(Color("Orange"))
            
            MessageField(messagesService: messageService, user: $user)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
