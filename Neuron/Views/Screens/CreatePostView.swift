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
        Group {
            if let user = mainViewModel.user  {
                Form {
                    Picker("What course is this for?", selection: $viewModel.course) {
                        ForEach(user.currentClasses.sorted(), id: \.self) {
                            Text($0)
                        }
                    }
                    
                    TextField("Title", text: $viewModel.title)
                    
                    TextEditor(text: $viewModel.description)
                    
                    NAttachmentPicker(title: "Add a photo (if applicable)", selection: $viewModel.pickerPicture, image: $viewModel.pictureImage)
                    
                    NButton(title: "Post", background: Color(.appBlue)) {
                        viewModel.post()
                        mainViewModel.tabSelection = 0
                    }
                }
                .font(Font.custom("Maven Pro", size: 18))
                .tint(Color(.appDarkBlue))
            } else {
                NLoadingScreen()
            }
        }
        .onAppear(perform: mainViewModel.fetchUser)
    }
}

#Preview {
    CreatePostView()
        .environmentObject(MainViewModel())
}
