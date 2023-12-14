//
//  ReceivedView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ReceivedView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @StateObject var viewModel = ReceivedViewModel()
    @FirestoreQuery(collectionPath: "posts") var posts: [Post]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading) {
                ForEach(posts) {
                    NPostView(post: $0)
                }
            }
        }
    }
}
