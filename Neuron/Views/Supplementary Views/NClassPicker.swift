//
//  NClassPicker.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import SwiftUI

struct NClassPicker: View {
    let title: String
    
    @Binding var searchText: String
    @Binding var categories: [ClassCategory]
    
    let update: () -> Void
    
    var body: some View {
        NTextField(title: title, placeholder: "AP Calculus AB", text: $searchText)
            .onDisappear(perform: update)
        
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading) {
                if categories.count != 0 {
                    ForEach(categories.indices) { i in
                        if categories[i].shouldShow(for: searchText) {
                            Text(categories[i].name)
                                .font(Font.custom("Maven Pro", size: 20).weight(.semibold))
                            NCategoryRow(category: $categories[i])
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
