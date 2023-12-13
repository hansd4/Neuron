//
//  ClassCategory.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/12/23.
//

import Foundation

struct ClassCategory: Codable, Comparable, Identifiable {
    let name: String
    let id: String
    let classes: [Course]
    
    static func < (lhs: ClassCategory, rhs: ClassCategory) -> Bool {
        if lhs.name != "Other" && rhs.name != "Other" {
            return lhs.name < rhs.name
        }
        return rhs.name == "Other"
    }
    
    func shouldShow(for query: String) -> Bool {
        if query.trimmingCharacters(in: .whitespaces).isEmpty {
            return true
        }
        
        for course in classes {
            if course.name.lowercased().contains(query.lowercased()) {
                return true
            }
        }
        
        return false
    }
}
