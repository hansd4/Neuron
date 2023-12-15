//
//  NLoadingScreen.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import SwiftUI

struct NLoadingScreen: View {
    let title: String
    
    var body: some View {
        Group {
            Text(title)
            ProgressView()
        }
        .font(Font.custom("Maven Pro", size: 18))
    }
}

#Preview {
    NLoadingScreen(title: "Loading profile...")
}
