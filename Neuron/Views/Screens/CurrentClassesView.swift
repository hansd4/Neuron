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
    @FirestoreQuery(collectionPath: "classes") var categories: [ClassCategory]
    
    var body: some View {
        NTextField(title: "Search for your current classes", placeholder: "AP Calculus AB", text: $viewModel.searchQuery)
        
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(categories) { category in
                    Text(category.name)
                        .font(Font.custom("Maven Pro", size: 20).weight(.semibold))
                    NCategoryRow(categoryID: category.id)
                        .environmentObject(viewModel)
                }
            }
        }
    }
}

#Preview {
    CurrentClassesView()
        .environmentObject(RegisterViewModel())
}
