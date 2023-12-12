//
//  ToDoListItem.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let name: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
