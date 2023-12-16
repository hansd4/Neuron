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
        VStack {
            if let user = mainViewModel.user  {
                ZStack {
                    Color(.appDarkBlue)
                        .ignoresSafeArea()
                    
                    HStack {
                        NProfilePicture(url: user.pfp, size: 50, strokeSize: 0)
                            .padding()
                        Spacer()
                        Text("\(user.totalXP) XP")
                            .font(Font.custom("Maven Pro", size: 24).weight(.medium))
                    }
                    .padding(.trailing)
                    .offset(y: 10)
                }
                .foregroundStyle(Color(.appOffWhite))
                .frame(maxWidth: .infinity, maxHeight: 70)
                .offset(y: -10)
                .shadow(radius: 10)
                
                Form {
                    Picker("What course do you need help with?", selection: $viewModel.course) {
                        ForEach(user.currentClassesWithOther, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    
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
                        mainViewModel.tabSelection = 1
                    }
                }
            } else {
                NLoadingScreen(title: "Loading...")
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
