//
//  ReceivedView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import SwiftUI

struct ReceivedView: View {
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
                            ForEach(Array(viewModel.postsByClass.keys).sorted(), id: \.self) { course in
                                if user.tutorClasses.keys.contains(course) {
                                    Section {
                                        ForEach(viewModel.postsByClass[course]!) { post in
                                            NavigationLink(destination: PostView(post: post).environmentObject(mainViewModel)) {
                                                NPostView(post: post)
                                            }
                                            .tint(.primary)
                                        }
                                    } header: {
                                        Text(course)
                                            .font(Font.custom("Maven Pro", size: 18))
                                            .opacity(0.5)
                                            .padding(.top, 5)
                                    }
                                }
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
        }
    }
}
