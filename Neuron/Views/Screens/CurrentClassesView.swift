//
//  CurrentClassesView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/11/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct CurrentClassesView: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        NClassPicker(title: "Search for your current classes",
                     searchText: $viewModel.searchQuery,
                     categories: $viewModel.categories,
                     update: viewModel.updateCurrentClasses)
    }
}

#Preview {
    CurrentClassesView()
        .environmentObject(RegisterViewModel())
}
