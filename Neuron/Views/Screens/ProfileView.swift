//
//  ProfileView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    ZStack {
                        Color(.appDarkBlue)
                            .ignoresSafeArea()
                        
                        HStack {
                            NProfilePicture(url: user.pfp, size: 90)
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(Font.custom("Maven Pro", size: 24).bold())
                                Text(user.email)
                                    .font(Font.custom("Maven Pro", size: 16))
                                    .opacity(0.5)
                            }
                        }
                        .padding()
                    }
                    .foregroundStyle(Color(.appOffWhite))
                    .frame(maxWidth: .infinity, maxHeight: 80)
                    
                    ScrollView(.vertical) {
                        LazyVStack(alignment: .leading) {
                            ForEach(Array(user.tutorClasses.keys).sorted(), id: \.self) { key in
                                Text(key)
                                    .padding(.top)
                            }
                        }
                    }
                    .padding()
                    .padding(.top, 20)
                } else {
                    Text("Loading profile...")
                    ProgressView()
                }
            }
        }
        .font(Font.custom("Maven Pro", size: 18))
        .onAppear() {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
