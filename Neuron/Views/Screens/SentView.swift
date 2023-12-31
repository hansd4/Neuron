//
//  SentView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import SwiftUI

struct SentView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @StateObject var viewModel = ReceivedViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = mainViewModel.user {
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
                    .frame(maxWidth: .infinity, maxHeight: 20)
                    .shadow(radius: 10)
                                        
                    ScrollView(.vertical) {
                        LazyVStack(alignment: .leading) {
                            ForEach(viewModel.posts.reversed().filter {
                                $0.authorID == user.id
                            }) { post in
                                NavigationLink(destination: PostView(post: post).environmentObject(mainViewModel)) {
                                    NPostView(post: post)
                                }
                                .tint(.primary)
                                .opacity(post.resolved ? 0.5 : 1)
                            }
                        }
                    }
                    .padding()
                    .padding(.top, 20)
                } else {
                    NLoadingScreen(title: "Loading profile...")
                }
            }
        }
        .onAppear {
            mainViewModel.fetchUser()
            viewModel.refreshPosts()
        }
    }
}
