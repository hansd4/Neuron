//
//  CreatePostView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import FirebaseAuth
import FirebaseFirestore
import SwiftUI


// TODO: FINISH (USE PROFILEVIEW AS EXAMPLE OF HOW TO GET USER BEFORE IT HAS BEEN MADE SINCE IT RETURNS NIL SINCE MAINVIEWMODEL HASN'T FETCHED THE USER YET)
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
            if let uid = mainViewModel.user?.id {
                viewModel.authorID = uid
                print("Fetched user: \(uid)")
            } else {
                if let user = mainViewModel.user {
                    print("Could not fetch user \(user.name)")
                }
                print("Could not fetch user")
            }
        }
    }
}

#Preview {
    CreatePostView()
        .environmentObject(MainViewModel())
}
