//
//  Firestore.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 19.12.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth


class FireStore : DataBase {
    
    
    //GoogleService-Info.plist should be added to .gitignore but because of educational practices not be done
    let db = Firestore.firestore()

    func getAllMessages<T: Codable>(collectionOrTableName: String, type: T.Type, completition: @escaping ([T]?, ErrorType?) -> Void) {
        
        let ownerId = Auth.auth().currentUser?.uid
        db.collection(collectionOrTableName).whereField("ownerId", isEqualTo: ownerId).addSnapshotListener { querySnapshot, error in
            
            if error != nil {
                completition(nil, .QueryError)
            }
            
            guard let documents = querySnapshot?.documents else {
                completition(nil, .DatabaseError)
                return
            }
             
            let datas = documents.compactMap {document -> T? in
                do {
                    return try document.data(as: T.self)
                }catch{
                    completition(nil, .InvalidData)
                    return nil
                }
            }
    
            completition(datas, nil)
        }
    }
    
    
    
    func sendMesages<T: Codable>(collectionOrTableName: String, data: T) throws  {
        do{
            try db.collection(collectionOrTableName).document().setData(from: data)
        }catch{
            throw ErrorType.SendError
        }
    }
    
}
