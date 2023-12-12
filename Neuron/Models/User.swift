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
    let pfp: Data
    let OSIS: String
    let currentClasses: [String]
    let tutorClasses: [String:[String:Double]]
}
