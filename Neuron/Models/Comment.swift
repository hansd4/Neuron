//
//  Comment.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import Foundation

struct Comment: Codable, Hashable, Identifiable {
    let id = UUID()
    let authorID: String
    let postDate: Date
    let text: String
}
