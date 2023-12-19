//
//  UserFeature.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 17.12.2023.
//

import Foundation


enum UserImage : String {
    case receiver = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWjI0y8fLH2QS7AjIzV_NHB0LaHy5RMiQUDlSyQweRu7MRl326SPdJm_PSibz5frviIqk&usqp=CAU)"
    case sender = "https://media.licdn.com/dms/image/D4E03AQGiqodRKMWL4A/profile-displayphoto-shrink_100_100/0/1689598719324?e=1708560000&v=beta&t=veK6uQPY2iK-foifajNEOEnw8m1JxADtNvhUcLqcx0o"
}


enum UserName : String {
    case receiverName = "Pearl Earring Girl"
    case senderName = "Me"
}


enum UserFeature {
    case Receiver
    case Sender
}

extension UserFeature {
    
    var userName : String {
        switch self {
            case .Receiver:
                return UserName.receiverName.rawValue
            case .Sender:
                return UserName.senderName.rawValue
        }
    }

    var userImage : String {
        switch self {
            case .Receiver:
                return UserImage.receiver.rawValue
            case .Sender:
                return UserImage.sender.rawValue
        }
    }
    
    var userState : Bool {
        switch self {
            case .Receiver:
                return true
            case .Sender:
                return false
        }
        
    }
    
}


