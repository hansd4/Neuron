//
//  NCategoryRow.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/12/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct NCategoryRow: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    @FirestoreQuery var classes: [Course]
    
    init(categoryID: String) {
        self._classes = FirestoreQuery(collectionPath: "classes/\(categoryID)/classes")
    }
    
    var body: some View {
        ForEach(classes) { course in
            NCourseRow(course: course)
                .environmentObject(viewModel)
                .padding(.leading, 25)
        }
    }
}

#Preview {
    NCategoryRow(categoryID: "04E72BB1-74D2-4196-9145-8E5233FFC38A")
        .environmentObject(RegisterViewModel())
}
