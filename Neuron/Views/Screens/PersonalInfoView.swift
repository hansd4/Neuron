//
//  PersonalInfoView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/11/23.
//

import SwiftUI

struct PersonalInfoView: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        Section("Enter your full name") {
            TextField("Name", text: $viewModel.name)
                .autocorrectionDisabled()
        }
        
        Section("Enter your OSIS number") {
            TextField("OSIS", value: $viewModel.OSIS, format: .number)
                .keyboardType(.numberPad)
        }
    }
}

#Preview {
    PersonalInfoView()
}
