//
//  AddingCommentView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/15/23.
//

import SwiftUI

struct AddingCommentView: View {
    @EnvironmentObject var viewModel: PostViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextEditor(text: $viewModel.commentField)
                    .font(Font.custom("Maven Pro", size: 16))
                
                NButton(title: "Comment", background: Color(.appDarkBlue)) {
                    viewModel.postComment()
                }
                
                Spacer()
            }
        }
    }
}
