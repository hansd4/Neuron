//
//  LaunchScreenView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            Color("appDarkBlue")
                .ignoresSafeArea()
            Text("Neuron")
                .font(Font.custom("Maven Pro", size: 48)
                .weight(.semibold))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    LaunchScreenView()
}
