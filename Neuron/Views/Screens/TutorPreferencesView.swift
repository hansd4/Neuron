//
//  TutorPreferencesView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import SwiftUI

struct TutorPreferencesView: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        Text("Rate yourself on these subjects")
            .font(Font.custom("Maven Pro", size: 16))
            .opacity(0.5)
        
        ScrollView(.vertical) {
            ForEach(Array(viewModel.tutorClasses.keys).sorted(), id: \.self) { key in
                NSlider(title: key, progress: Binding(get: {
                    return viewModel.tutorClasses[key]?["pref"] ?? 1.0
                }, set: {
                    viewModel.tutorClasses[key]?["pref"] = $0
                }))
            }
        }
    }
}

#Preview {
    TutorPreferencesView()
        .environmentObject(RegisterViewModel())
}
