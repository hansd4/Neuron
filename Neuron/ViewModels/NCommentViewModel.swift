//
//  NCommentViewModel.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/15/23.
//

import Foundation
import FirebaseFirestore

class NCommentViewModel: ObservableObject {
    @Published var commenter: User? = nil
    
    init() {}
    
    func fetchCommenter(id: String) {
        // print("Fetching commenter \(id)")
        let db = Firestore.firestore()
        db.collection("users").document(id).getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                print("error", error ?? "")
                return
            }
            
            DispatchQueue.main.async {
                self.commenter = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    pfp: data["pfp"] as? String ?? "",
                    OSIS: data["OSIS"] as? String ?? "",
                    currentClasses: data["currentClasses"] as? [String] ?? [],
                    tutorClasses: data["tutorClasses"] as? [String:[String:Double]] ?? [:],
                    posts: data["posts"] as? [String] ?? [])
            }
        }
    }
}
