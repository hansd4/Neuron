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
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView(selection: $viewModel.tabSelection) {
            ReceivedView()
                .tabItem {
                    Label("Posts", systemImage: "questionmark.bubble.fill")
                }
                .tag(0)
                .environmentObject(viewModel)
            
            SentView()
                .tabItem {
                    Label("My Posts", systemImage: "person.fill.questionmark")
                }
                .tag(1)
                .environmentObject(viewModel)
            
            CreatePostView()
                .tabItem {
                    Label("Create Post", systemImage: "plus")
                }
                .tag(2)
                .environmentObject(viewModel)
            
            ProfileView()
                .tabItem {
                    Label("My Profile", systemImage: "person.crop.circle")
                }
                .tag(3)
                .environmentObject(viewModel)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tag(4)
                .environmentObject(viewModel)
        }
        .tint(Color(.appBlue))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
