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
        
        ForEach(CourseCategory.allCategories) { category in
            Text(category.name)
            ForEach(category.courses, id: \.self) { course in
                Text(course)
                    .padding(.leading)
            }
        }
    }
}

#Preview {
    CurrentClassesView()
        .environmentObject(RegisterViewModel())
}
