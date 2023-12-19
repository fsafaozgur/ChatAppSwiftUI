//
//  ErrorType.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 18.12.2023.
//

import Foundation

enum ErrorType : Error {
    case InvalidData
    case DatabaseError
    case QueryError
    case SendError
    
    var description : String {
        switch self {
        case .InvalidData:
            return "Data corrapted"
        case .DatabaseError:
            return "Database Error"
        case .QueryError:
            return "Query Error Occured"
        case .SendError:
            return "Data cannot be sent"
        }
    }
}
