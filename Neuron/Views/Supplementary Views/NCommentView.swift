//
//  NCommentView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/15/23.
//

import SwiftUI

struct NCommentView: View {
    let comment: Comment
    let commenter: User
    
    var body: some View {
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
}
