//
//  SettingsView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    ZStack {
                        Color(.appDarkBlue)
                            .ignoresSafeArea()
                        
                        HStack {
                            NProfilePicture(url: user.pfp, size: 90)
                                .padding()
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
                    Spacer()
                    Button("Log out", role: .destructive) {
                        viewModel.logOut()
                    }
                    .padding(.bottom, 35)
                } else {
                    NLoadingScreen(title: "Loading...")
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
    SettingsView()
}
