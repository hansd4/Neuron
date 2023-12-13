//
//  TutorClassesView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/11/23.
//

import SwiftUI

struct TutorClassesView: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        NClassPicker(title: "Classes you can tutor",
                     searchText: $viewModel.searchQuery,
                     categories: $viewModel.categories,
                     update: viewModel.updateTutorClasses)
    }
}

#Preview {
    TutorClassesView()
}
