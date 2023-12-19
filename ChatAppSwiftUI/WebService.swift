//
//  WebService.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 17.12.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class WebService : ObservableObject {
    @Published var messages: [Message] = []
    @Published var lastMessageId = ""
    let db = Firestore.firestore()
    
    init(){
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print(error?.localizedDescription)
                return
            }
             
            self.messages = documents.compactMap {document -> Message? in
                do {
                    return try document.data(as: Message.self)
                }catch{
                    print(error.localizedDescription)
                    return nil
                }
            }
            
            self.messages.sort { $0.messageTime < $1.messageTime }
            
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    func sendMesages(text: String, isReceiver: Bool) {
        do{
            let newMessage = Message(id: "\(UUID())", text: text, isReceiver: !isReceiver, messageTime: Date())
            try db.collection("messages").document().setData(from: newMessage)
        }catch{
            print(error.localizedDescription)
        }
    }
    
}



