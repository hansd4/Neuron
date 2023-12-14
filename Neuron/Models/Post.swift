//
//  Post.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import Foundation
import FirebaseFirestore

struct Post: Codable {
    @DocumentID var id: String?
    let authorID: String
    let postDate: TimeInterval
    let course: String
    let title: String
    let description: String
    let picture: String?
    let comments: [Comment]
}