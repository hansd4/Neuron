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
    @StateObject var viewModel = PostViewModel()
    
    let post: Post
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if let user = mainViewModel.user {
                    ZStack {
                        Color(.appDarkBlue)
                            .ignoresSafeArea()
                        
                        HStack {
                            NProfilePicture(url: user.pfp, size: 50, strokeSize: 0)
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
                            Text(post.title)
                                .font(Font.custom("Maven Pro", size: 28).weight(.semibold))
                            Text(post.description)
                                .font(Font.custom("Maven Pro", size: 16))
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
            print(post.picture ?? "")
        }
    }
}
