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
        NTextField(title: "Search for your current classes", placeholder: "AP Calculus AB", text: $viewModel.searchQuery)
        
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading) {
                if viewModel.categories.count != 0 {
                    ForEach(viewModel.categories.indices) { i in
                        if viewModel.categories[i].shouldShow(for: viewModel.searchQuery) {
                            Text(viewModel.categories[i].name)
                                .font(Font.custom("Maven Pro", size: 20).weight(.semibold))
                            NCategoryRow(category: $viewModel.categories[i])
                                .environmentObject(viewModel)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    CurrentClassesView()
        .environmentObject(RegisterViewModel())
}
