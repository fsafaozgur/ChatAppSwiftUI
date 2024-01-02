//
//  Database.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 19.12.2023.
//

import Foundation


//In case of using different database service, Strategy design pattern should be used
protocol DataBase {
    func getAllMessages<T: Codable>(collectionOrTableName : String, userIdColName: String, type: T.Type, completition: @escaping ([T]?, ErrorType?) -> Void)
    func sendMesages<T:Codable>(collectionOrTableName: String, data: T) throws
    
}
