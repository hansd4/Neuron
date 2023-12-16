//
//  Post.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import Foundation
import FirebaseFirestore
import SwiftUI

struct Post: Codable, Identifiable {
    @DocumentID var id: String?
    let authorID: String
    let postDate: Date
    let course: String
    let title: String
    let description: String
    let picture: String?
    var comments: [Comment]
    var resolved: Bool
    
    var xp: Int32 {
        return postDifficulty(postDate.timeIntervalSinceNow, Int32(comments.count), 5)
    }
    
    var xpColor: Color {
        switch xp {
        case 1...3:
            return Color(.appLightBlue)
        case 4...7:
            return Color(.appBlue)
        case 8...10:
            return Color(.appDarkBlue)
        default:
            return .primary
        }
    }
    
    mutating func addComment(_ comment: Comment) {
        comments.append(comment)
    }
    
    mutating func findSolution() {
        resolved = true
    }
}
