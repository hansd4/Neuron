//
//  ContentView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/9/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty || true {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ReceivedView()
                .tabItem {
                    Label("Posts", systemImage: "questionmark.bubble.fill")
                }
            
            SentView()
                .tabItem {
                    Label("My Posts", systemImage: "person.fill.questionmark")
                }
            
            CreatePostView()
                .tabItem {
                    Label("Create Post", systemImage: "plus")
                }
            
            ProfileView()
                .tabItem {
                    Label("My Profile", systemImage: "person.crop.circle")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .tint(Color(.appBlue))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
