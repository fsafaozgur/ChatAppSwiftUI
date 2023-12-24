//
//  Message.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 17.12.2023.
//

import Foundation

struct Message : Codable, Identifiable {
    let id: String
    let text: String
    let isReceiver : Bool
    let messageTime: Date
}
