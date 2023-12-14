//
//  CreatePostView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import FirebaseAuth
import FirebaseFirestore
import SwiftUI

struct CreatePostView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @StateObject var viewModel = CreatePostViewModel()
    
    var body: some View {
        Form {
            if let user = mainViewModel.user  {
                Picker("What course do you need help with?", selection: $viewModel.course) {
                    ForEach(user.currentClassesWithOther, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)
                
                TextField("Title", text: $viewModel.title)
                
                TextEditor(text: $viewModel.description)
                
                NAttachmentPicker(title: "Add a photo (if applicable)", selection: $viewModel.pickerPicture, image: $viewModel.pictureImage)
                
                NButton(title: "Post", background: Color(.appBlue)) {
                    if let uid = mainViewModel.user?.id {
                        viewModel.authorID = uid
                        print("Fetched user: \(uid)")
                    } else {
                        print("Could not fetch user")
                    }
                    
                    viewModel.post()
                    mainViewModel.tabSelection = 0
                }
            } else {
                NLoadingScreen()
            }
        }
        .font(Font.custom("Maven Pro", size: 18))
        .tint(Color(.appDarkBlue))
        .onAppear {
            mainViewModel.fetchUser()
        }
    }
}

#Preview {
    CreatePostView()
        .environmentObject(MainViewModel())
}
