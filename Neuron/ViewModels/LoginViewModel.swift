//
//  LoginViewModel.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @Published var showingAlert = false
    @Published var errorTitle = ""
    @Published var errorMessage = ""
    
    @Published var showingRegister = false
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorTitle = "Invalid Email"
            errorMessage = "Please enter an email."
            showingAlert = true
            return false
        }
        
        guard !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorTitle = "Invalid Password"
            errorMessage = "Please enter a secure password."
            showingAlert = true
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorTitle = "Invalid Email"
            errorMessage = "Please enter a valid email."
            showingAlert = true
            return false
        }
        
        return true
    }
}
