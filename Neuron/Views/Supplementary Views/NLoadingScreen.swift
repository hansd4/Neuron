//
//  NLoadingScreen.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import SwiftUI

struct NLoadingScreen: View {
    var body: some View {
        Group {
            Text("Loading profile...")
            ProgressView()
        }
        .font(Font.custom("Maven Pro", size: 18))
    }
}

#Preview {
    NLoadingScreen()
}
