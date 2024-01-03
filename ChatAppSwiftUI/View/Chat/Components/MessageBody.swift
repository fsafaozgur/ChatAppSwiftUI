//
//  MessageBody.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 17.12.2023.
//

import SwiftUI

struct MessageBody: View {
    
    var message: Message
    @Binding var user : UserFeature
    
    var body: some View {
        VStack(alignment: message.isReceiver ? .leading : .trailing){
            
            
            VStack(alignment: message.isReceiver == user.userState ? .leading : .trailing){
               
                Text(message.text)
                        .padding(.horizontal)
                        .padding(.top)
                    
                Text(message.messageTime.formatted(.dateTime.hour().minute()))
                    .font(.caption)
                    .padding(.horizontal)
                    .padding(.bottom)
                

                
            }
            .background(message.isReceiver == user.userState  ? Color.messageGray : Color.messageOrange)
            .cornerRadius(35)
            .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: message.isReceiver == user.userState ? .leading : .trailing)
            
        }

        .frame(width: UIScreen.main.bounds.width, alignment: message.isReceiver == user.userState ? .leading : .trailing)
        .padding(message.isReceiver == user.userState ? .leading : .trailing)
        .padding(.horizontal)
        .padding(.vertical, 3)
    }
    
    
    
    
    
    
}
/*
struct MessageBodyView_Previews: PreviewProvider {
    static var previews: some View {
        MessageBody(message: Message(id: "1234", text: "hey whats up man", isReceiver: false, messageTime: Date()))
    }
}*/
