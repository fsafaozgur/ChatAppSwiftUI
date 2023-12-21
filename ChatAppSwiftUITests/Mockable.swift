//
//  Mockable.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 21.12.2023.
//

import Foundation
@testable import ChatAppSwiftUI

protocol Mockable {
    var bundle : Bundle {get}
    
    func loadFromJson<T: Codable>(jsonName: String, type: T.Type, completition: @escaping ([T]?, ErrorType?) -> Void)
}


extension Mockable {
    
    

    var bundle : Bundle {
        return Bundle(for: type(of: self) as! AnyClass)
    }
    
    func loadFromJson<T: Codable>(jsonName: String, type: T.Type, completition: @escaping ([T]?, ErrorType?) -> Void) {
                
        guard let url = bundle.url(forResource: jsonName, withExtension: "json") else {return}
  
        
        do{
            let data =  try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let messages = try decoder.decode([T].self, from: data)
            completition(messages, nil)
        }catch{
            print(error.localizedDescription)
            completition(nil, .InvalidData)
        }
        
    }

}
