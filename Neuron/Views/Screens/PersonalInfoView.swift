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
        NTextField(title: "Enter your full name", placeholder: "Name", text: $viewModel.name)
            .autocorrectionDisabled()
        
        NTextField(title: "Enter your OSIS number", placeholder: "OSIS", text: $viewModel.OSIS)
            .keyboardType(.numberPad)
    }
}

#Preview {
    PersonalInfoView()
        .environmentObject(RegisterViewModel())
}
