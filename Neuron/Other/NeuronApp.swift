//
//  NeuronApp.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/9/23.
//

import FirebaseCore
import SwiftUI

@main
struct NeuronApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
