//
//  EmailView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/11/23.
//

import SwiftUI

struct EmailView: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        NTextField(title: "Enter your email address", placeholder: "Email Address", text: $viewModel.email)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
        
        NSecureField(title: "Enter a secure password", placeholder: "Password", text: $viewModel.password)
    }
}

#Preview {
    EmailView()
        .environmentObject(RegisterViewModel())
}
