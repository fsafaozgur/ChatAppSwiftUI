//
//  ChatViewModel.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 18.12.2023.
//

import Foundation


class ChatViewModel : ObservableObject {
    var service : WebService = WebService()
    @Published var messages: [Message] = []
    @Published var lastMessageId = ""
    @Published var error: ErrorType?
    @Published var hasError : Bool = false

    
    func getMessages() async {
        service.getMessages(collectionName: "messages", type: Message.self) { [weak self] messages, error in
            
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
        
        let newMessage = Message(id: "\(UUID())", text: text, isReceiver: !isReceiver, messageTime: Date())
        do{
            try service.sendMesages(collectionName: "messages", data: newMessage)
        }catch{
            hasError = true
            self.error = .SendError
        }
    }
}


