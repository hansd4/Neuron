//
//  ProfilePictureView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/11/23.
//

import SwiftUI
import PhotosUI

struct ProfilePictureView: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        NPhotoPicker(title: "Choose a profile picture", selection: $viewModel.pfpItem, image: $viewModel.pfpImage)
        
        NTextCaption(content: "Profile pictures must be school appropriate. Profile pictures found to be in violation of school policy will be removed, and those who used them may be restricted from using the feature in the future.")
    }
}

#Preview {
    ProfilePictureView()
        .environmentObject(RegisterViewModel())
}
