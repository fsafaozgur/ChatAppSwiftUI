//
//  MessageField.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 17.12.2023.
//

import SwiftUI

struct MessageField: View {
    @ObservedObject var messagesService: WebService
    @State var message = ""
    @Binding var user : UserFeature
    
    var body: some View {
        HStack{
            CustomTextField(placeHolder: Text("Enter your message"), text: $message)
            Button {
                messagesService.sendMesages(text: message, isReceiver: user.userState)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("Orange"))
                    .cornerRadius(30)
            }


        }
        .padding(.horizontal)
        .padding(.vertical, 6)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()

        
    }
}
/*
struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
    }
}*/


struct CustomTextField: View {
    var placeHolder: Text
    @Binding var text: String
    //initialized empty closure to pass it
    var editingChanged: (Bool) -> Void = { _ in }
    //initialized empty closure to pass it
    var commit: () -> Void = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeHolder
                    .opacity(0.5)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
            
        }
    }
}
