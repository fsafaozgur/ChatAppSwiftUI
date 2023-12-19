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
    
    //GoogleService-Info.plist should be added to .gitignore but because of educational practices not be done
    
    let db = Firestore.firestore()
    
    
    func getMessages<T: Codable>(collectionName : String, type: T.Type, completition: @escaping ([T]?, ErrorType?) -> Void) {
        
        db.collection(collectionName).addSnapshotListener { querySnapshot, error in
            
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
    
    func sendMesages<T:Codable>(collectionName: String, data: T) throws {
        do{
            try db.collection(collectionName).document().setData(from: data)
        }catch{
            throw ErrorType.SendError
        }
    }
    
}



