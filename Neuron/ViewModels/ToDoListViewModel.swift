//
//  ToDoListViewModel.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import FirebaseFirestore
import Foundation

class ToDoListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }

    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
    }
}
