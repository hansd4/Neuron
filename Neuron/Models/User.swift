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
    
    var currentClassesWithOther: [String] {
        let newArray = ["Other"]
        return newArray + currentClasses.sorted()
    }
}
