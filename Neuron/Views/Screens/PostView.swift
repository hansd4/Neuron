//
//  PostView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/14/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @StateObject var viewModel: PostViewModel
    
    let post: Post
    
    init(post: Post) {
        self.post = post
        self._viewModel = StateObject(wrappedValue: PostViewModel(post: post))
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if let user = mainViewModel.user, let postUser = viewModel.postUser {
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
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                Text(post.title)
                                    .font(Font.custom("Maven Pro", size: 24).weight(.medium))
                                Spacer()
                                Text("+\(post.xp) XP")
                                    .font(Font.custom("Maven Pro", size: 24).weight(.semibold))
                                    .foregroundStyle(post.xpColor)
                            }
                            HStack(alignment: .center) {
                                NProfilePicture(url: postUser.pfp, size: 30, strokeSize: 0)
                                VStack(alignment: .leading) {
                                    Text(postUser.name)
                                        .font(Font.custom("Maven Pro", size: 14).weight(.medium))
                                    Text(post.postDate.formatted(date: .abbreviated, time: .shortened))
                                        .font(Font.custom("Maven Pro", size: 14))
                                        .opacity(0.5)
                                }
                            }
                            if let urlString = post.picture {
                                WebImage(url: URL(string: urlString))
                                    .resizable()
                                    .scaledToFill()
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(.primary, lineWidth: 2))
                                    .frame(maxWidth: .infinity, maxHeight: 250)
                                    .padding(.vertical)
                            }
                            Text(post.description)
                                .font(Font.custom("Maven Pro", size: 16))
                            
                            HStack {
                                Text("\(post.comments.count) Comments")
                                    .font(Font.custom("Maven Pro", size: 20))
                                    .padding(.top)
                                Button {
                                    viewModel.addingComment = true
                                } label: {
                                    Image(systemName: "plus")
                                }
                                .sheet(isPresented: $viewModel.addingComment) {
                                    AddingCommentView()
                                        .environmentObject(viewModel)
                                }
                            }
                            ForEach(post.comments) { comment in
                                if let commenter = viewModel.commentUsers[comment.authorID] {
                                    NCommentView(comment: comment, commenter: commenter)
                                        .padding(.top)
                                } else {
                                    NLoadingScreen(title: "Loading...")
                                }
                            }
                        }
                    }
                    .padding()
                    .padding(.top, 20)
                } else {
                    VStack(alignment: .center) {
                        NLoadingScreen(title: "Loading...")
                    }
                }
            }
        }
        .onAppear {
            mainViewModel.fetchUser()
            viewModel.fetchUser()
            for comment in post.comments {
                viewModel.fetchCommenter(id: comment.authorID)
            }
        }
    }
}
