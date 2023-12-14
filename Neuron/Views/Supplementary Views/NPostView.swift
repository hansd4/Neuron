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
                .font(Font.custom("Maven Pro", size: 24).bold())
            NTextCaption(content: post.description)

        }
        .font(Font.custom("Maven Pro", size: 16))
    }
}
