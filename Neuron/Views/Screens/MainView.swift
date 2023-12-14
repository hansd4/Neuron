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
                .onAppear(perform: Classes.sendToFirebase)
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ReceivedView()
                .tabItem {
                    Image(systemName: "questionmark.bubble.fill")
                }
            
            SentView()
                .tabItem {
                    Image(systemName: "person.fill.questionmark")
                }
            
            CreatePostView()
                .tabItem {
                    Image(systemName: "plus")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
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
