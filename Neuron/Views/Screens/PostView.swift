//
//  PostView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/14/23.
//

import SwiftUI

struct PostView: View {
    let post: Post
    
    var body: some View {
        Text(post.title)
    }
}
