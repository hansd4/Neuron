//
//  NCategoryRow.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/12/23.
//

import SwiftUI

struct NCategoryRow: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    
    let category: ClassCategory
    
    var body: some View {
        ForEach(category.classes.sorted()) { course in
            if course.name.lowercased().contains(viewModel.searchQuery.lowercased()) || viewModel.searchQuery.trimmingCharacters(in: .whitespaces).isEmpty {
                NCourseRow(course: course)
                    .environmentObject(viewModel)
                    .padding(.leading, 25)
            }
        }
    }
}
