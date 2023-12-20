//
//  WebService.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 17.12.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class WebService {
    
    
    var databaseService : DataBase
    
    //In case of using different database service, Strategy design pattern be applied
    init(databaseService: DataBase) {
        self.databaseService = databaseService
    }
    
    func getAllMessages<T: Codable>(collectionOrTableName : String, type: T.Type, completition: @escaping ([T]?, ErrorType?) -> Void) {
        
        databaseService.getAllMessages(collectionOrTableName: collectionOrTableName, type: T.self) { datas, error in
            completition(datas, error)
       
        }
        
    }
    
    func sendMesages<T:Codable>(collectionOrTableName: String, data: T) throws {
        
        do{
            try databaseService.sendMesages(collectionOrTableName: collectionOrTableName, data: data)
        }catch(let error){
            throw error
        }
        
    }
    
}



