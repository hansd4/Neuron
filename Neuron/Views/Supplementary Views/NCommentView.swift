//
//  NCommentView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/15/23.
//

import SwiftUI
import FirebaseFirestore

struct NCommentView: View {
    @StateObject var viewModel = NCommentViewModel()
    let comment: Comment
    
    var body: some View {
        Group {
            if let commenter = viewModel.commenter {
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        NProfilePicture(url: commenter.pfp, size: 30, strokeSize: 0)
                        VStack(alignment: .leading) {
                            Text(commenter.name)
                                .font(Font.custom("Maven Pro", size: 14).weight(.medium))
                            Text(comment.postDate.formatted(date: .abbreviated, time: .shortened))
                                .font(Font.custom("Maven Pro", size: 14))
                                .opacity(0.5)
                        }
                    }
                    Text(comment.text)
                        .font(Font.custom("Maven Pro", size: 16))
                }
            } else {
                NLoadingScreen(title: "Loading comment...")
            }
        }
        .onAppear {
            viewModel.fetchCommenter(id: comment.authorID)
        }
    }
}
