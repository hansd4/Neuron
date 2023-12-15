//
//  User.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let pfp: String
    let OSIS: String
    let currentClasses: [String]
    let tutorClasses: [String:[String:Double]]
    var posts: [String]
    
    var currentClassesWithOther: [String] {
        let newArray = ["Other"]
        return newArray + currentClasses.sorted()
    }
    
    var totalXP: Int {
        var xp = 0
        for course in tutorClasses.keys {
            if let courseXP = tutorClasses[course]?["xp"] {
                xp += Int(courseXP)
            }
        }
        return xp
    }
    
    mutating func appendPost(_ post: String) {
        posts.append(post)
    }
}
