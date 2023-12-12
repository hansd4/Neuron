//
//  ToDoListItemViewModel.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var copiedItem = item
        copiedItem.setDone(!item.isDone)
        
        guard let ID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(ID)
            .collection("todos")
            .document(copiedItem.id)
            .setData(copiedItem.asDictionary())
    }
}
