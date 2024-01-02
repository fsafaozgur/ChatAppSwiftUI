//
//  MockWebService.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 21.12.2023.
//

import Foundation
import FirebaseFirestore
@testable import ChatAppSwiftUI

class MockWebService : Service, Mockable {

    
    func getAllMessages<T: Codable>(collectionOrTableName: String, userIdColName: String, type: T.Type, completition: @escaping ([T]?, ErrorType?) -> Void) {

        
        loadFromJson(jsonName: "MockMessages", type: T.self) { messages, error in
            completition(messages, error)
        }
    }
    
    
    
    
    func sendMesages<T: Codable>(collectionOrTableName: String, data: T) throws {
        //this code not being tested for now
    }
    
  
    
}
