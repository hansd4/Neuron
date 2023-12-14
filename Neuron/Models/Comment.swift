//
//  Comment.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import Foundation

struct Comment: Codable, Hashable {
    let authorID: String
    let postDate: TimeInterval
    let text: String
    let picture: String?
}
