//
//  Message.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 17.12.2023.
//

import Foundation

struct Message : Codable, Identifiable {
    var id: String
    var text: String
    var isReceiver : Bool
    var messageTime: Date
}
