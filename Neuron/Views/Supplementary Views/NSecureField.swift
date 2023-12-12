//
//  NSecureField.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/11/23.
//

import SwiftUI

struct NSecureField: View {
    let title: String
    let placeholder: String
    
    @Binding var text: String
    
    var body: some View {
        Section {
            SecureField(placeholder, text: $text)
                .textFieldStyle(.plain)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                .overlay(
                    Rectangle()
                        .fill(.secondary)
                        .opacity(0.5)
                        .frame(height: 1),
                    alignment: .bottom
                )
                .padding(.bottom, 10)
        } header: {
            Text(title)
                .opacity(0.5)
        }
        .font(Font.custom("Maven Pro", size: 16))
    }
}

#Preview {
    NSecureField(title: "Title", placeholder: "Placeholder", text: Binding.constant(""))
}
