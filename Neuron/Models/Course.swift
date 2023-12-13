//
//  Course.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/12/23.
//

import Foundation

struct Course: Codable, Comparable, Identifiable {
    let name: String
    let id: String
    var selected: Bool = false
    
    private enum CodingKeys: String, CodingKey {
            case name, id
        }
    
    static func < (lhs: Course, rhs: Course) -> Bool {
        lhs.name < rhs.name
    }
}
