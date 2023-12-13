//
//  NCategoryRow.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/12/23.
//

import SwiftUI

struct NCategoryRow: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    @Binding var category: ClassCategory
    
    var body: some View {
        if category.classes.count != 0 {
            ForEach(category.classes.indices) { i in
                if category.classes[i].name.lowercased().contains(viewModel.searchQuery.lowercased()) || viewModel.searchQuery.trimmingCharacters(in: .whitespaces).isEmpty {
                    NCourseRow(course: $category.classes[i])
                        .environmentObject(viewModel)
                        .padding(.leading, 25)
                }
            }
        }
    }
}
