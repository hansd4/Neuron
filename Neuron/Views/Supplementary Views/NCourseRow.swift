//
//  NCourseRow.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/12/23.
//

import SwiftUI

struct NCourseRow: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    @Binding var course: Course
    
    var body: some View {
        Toggle(isOn: $course.selected) {
            Text(course.name)
                .font(Font.custom("Maven Pro", size: 16).weight(.medium))
                .tint(.secondary)
        }
        .toggleStyle(.button)
    }
}
