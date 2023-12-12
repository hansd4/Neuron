//
//  CurrentClassesViw.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/11/23.
//

import SwiftUI

struct CurrentClassesView: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        NTextField(title: "Search for your current classes", placeholder: "AP Calculus AB", text: $viewModel.searchQuery)
        
        ForEach(Classes.CLASSES.sorted(), id: \.key) { key, value in
            Section(header: Text(key)) {
                ForEach(value, id: \.self) { course in
                    
                }
            }
        }
    }
}

#Preview {
    CurrentClassesView()
}
