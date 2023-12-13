//
//  RegisterViewModel.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation
import SwiftUI
import PhotosUI

@MainActor class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var pfp = UIImage(systemName: "person.circle.fill")
    @Published var OSIS = ""
    @Published var currentClasses = [String]()
    @Published var tutorClasses = [String:[String:Double]]()
    
    @Published var activeScreen = 0
    
    @Published var errorTitle = ""
    @Published var errorMessage = ""
    @Published var showingError = false
    
    @Published var pfpItem: PhotosPickerItem? {
        didSet { Task { try await loadImage() } }
    }
    @Published var pfpImage: Image?
    
    @Published var categories = [ClassCategory]()
    @Published var searchQuery = ""
    
    init() {}
    
    func register() {
        for key in tutorClasses.keys {
            for pref in tutorClasses[key]! {
                print("\(key) : \(tutorClasses[key]?[pref])")
            }
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userID)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           pfp: pfp?.jpegData(compressionQuality: 0.5) ?? Data(),
                           OSIS: OSIS,
                           currentClasses: currentClasses,
                           tutorClasses: tutorClasses)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    func validate() -> Bool {
        switch activeScreen {
        case 0:
            guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
                errorTitle = "Invalid Email"
                errorMessage = "Please enter an email."
                showingError = true
                return false
            }
            
            guard !password.trimmingCharacters(in: .whitespaces).isEmpty else {
                errorTitle = "Invalid Password"
                errorMessage = "Please enter a secure password."
                showingError = true
                return false
            }
            
            guard email.contains("@") && email.contains(".") else {
                errorTitle = "Invalid Email"
                errorMessage = "Please enter a valid email."
                showingError = true
                return false
            }
            
            guard password.count >= 6 else {
                errorTitle = "Invalid Password"
                errorMessage = "Please enter a password longer than 6 characters."
                showingError = true
                return false
            }
            
            return true
        case 1:
            // check valid name and osis
            guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
                errorTitle = "Invalid Name"
                errorMessage = "Please enter your full name."
                showingError = true
                return false
            }
            
            guard !OSIS.trimmingCharacters(in: .whitespaces).isEmpty else {
                errorTitle = "Invalid OSIS"
                errorMessage = "Please enter your OSIS number."
                showingError = true
                return false
            }
            
            guard name.contains(" ") else {
                errorTitle = "Invalid Name"
                errorMessage = "Please provide your full legal name."
                showingError = true
                return false
            }
            
            guard let osisNum = Int(OSIS) else {
                errorTitle = "Invalid OSIS"
                errorMessage = "Please enter a valid OSIS number."
                showingError = true
                return false
            }
            
            guard 100_000_000...1_000_000_000 ~= osisNum else {
                errorTitle = "Invalid OSIS"
                errorMessage = "Please enter a valid OSIS number."
                showingError = true
                return false
            }
            
            return true
        default:
            return true
        }
    }
    
    func loadImage() async throws {
        guard let item = pfpItem else { return }
        guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: imageData) else { return }
        self.pfp = uiImage
        self.pfpImage = Image(uiImage: uiImage)
    }
    
    func refreshClasses() {
        // getting class directory from firebase
        categories.removeAll()
        let db = Firestore.firestore()
        db.collection("classes").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.categories.append(ClassCategory.fromDictionary(document.data())!)
                }
            }
        }
        
        // sorting results
        categories.sort()
        for i in categories.indices {
            categories[i].classes.sort()
        }
    }
    
    func updateCurrentClasses() {
        currentClasses.removeAll()
        for category in categories {
            for course in category.classes {
                if course.selected {
                    currentClasses.append(course.name)
                }
            }
        }
        searchQuery = ""
        print("Current classes updated: \(currentClasses)")
    }
    
    func updateTutorClasses() {
        tutorClasses.removeAll()
        for category in categories {
            for course in category.classes {
                if course.selected {
                    tutorClasses[course.name] = [
                        "pref":1.0,
                        "xp":0.0
                    ]
                }
            }
        }
        searchQuery = ""
        print("Tutor classes updated: \(tutorClasses)")
    }
}
