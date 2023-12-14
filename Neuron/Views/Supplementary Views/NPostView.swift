//
//  NPostView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/14/23.
//

import SwiftUI

struct NPostView: View {
    let post: Post
    
    // TODO: get author from database
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(Font.custom("Maven Pro", size: 20).bold())
            Text(post.description)
                .font(Font.custom("Maven Pro", size: 12))
                .opacity(0.5)
                .truncationMode(.tail)
        }
        .font(Font.custom("Maven Pro", size: 16))
    }
}
