//
//  NewItemViewModel.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewModel: ObservableObject {
    @Published var name = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        guard let ID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newID = UUID().uuidString
        let newItem = ToDoListItem(
            id: newID,
            name: name,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(ID)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
