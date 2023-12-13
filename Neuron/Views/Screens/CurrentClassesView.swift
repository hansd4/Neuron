//
//  CurrentClassesViw.swift
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
                ForEach(viewModel.categories.sorted()) { category in
                    if category.shouldShow(for: viewModel.searchQuery) {
                        Text(category.name)
                            .font(Font.custom("Maven Pro", size: 20).weight(.semibold))
                        NCategoryRow(category: category)
                            .environmentObject(viewModel)
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
