//
//  ProfileViewModel.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User? = nil
    
    init() {}
    
    func fetchUser() {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("No current user detected")
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userID).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                print("error", error ?? "")
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    pfp: data["pfp"] as? Data ?? UIImage(systemName: "person.circle.fill")?.jpegData(compressionQuality: 0.5) ?? Data(),
                    OSIS: data["OSIS"] as? String ?? "",
                    currentClasses: data["currentClasses"] as? [String] ?? [],
                    tutorClasses: data["tutorClasses"] as? [String:[String:Double]] ?? [:])
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
