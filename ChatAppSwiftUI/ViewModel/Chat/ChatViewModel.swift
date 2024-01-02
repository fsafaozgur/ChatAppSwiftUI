//
//  ChatViewModel.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 18.12.2023.
//

import Foundation
import FirebaseAuth


class ChatViewModel : ObservableObject {
    
    var service : Service
    
    @Published var messages: [Message] = []
    @Published var lastMessageId = ""
    @Published var error: ErrorType?
    @Published var hasError : Bool = false

    init(service : Service){
        self.service = service
    }
    
    func getMessages() async {
        service.getAllMessages(collectionOrTableName: "messages", userIdColName: "ownerId", type: Message.self) { [weak self] messages, error in
            
            if error != nil {
                self?.hasError = true
                self?.error = error
            }
            
            guard var messages = messages else {return}
            
            messages.sort { $0.messageTime < $1.messageTime }

            if let id = messages.last?.id {
                self?.lastMessageId = id
            }
            
            self?.messages = messages
        }
    }
    
    func sendMesages(text: String, isReceiver: Bool) {
        
        let userId = Auth.auth().currentUser?.uid
        let newMessage = Message(id: "\(UUID())", ownerId: userId ?? "", text: text, isReceiver: !isReceiver, messageTime: Date())
        do{
            try service.sendMesages(collectionOrTableName: "messages", data: newMessage)
        }catch{
            hasError = true
            self.error = .SendError
        }
    }
}


