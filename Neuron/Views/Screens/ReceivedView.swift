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
            ForEach(Array(viewModel.postsByClass.keys).sorted(), id: \.self) { course in
                Section {
                    List(viewModel.postsByClass[course]!) { post in
                        NavigationLink(destination: PostView(post: post)) {
                            NPostView(post: post)
                        }
                    }
                } header: {
                    Text(course)
                        .font(Font.custom("Maven Pro", size: 18))
                        .opacity(0.5)
                }
            }
            .onAppear {
                viewModel.updatePostsByClass()
                print(viewModel.postsByClass)
            }
        }
    }
}
