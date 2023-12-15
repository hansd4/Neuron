//
//  NPostView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/14/23.
//

import SwiftUI

struct NPostView: View {
    let post: Post
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(Font.custom("Maven Pro", size: 20).bold())
                Text(post.description)
                    .font(Font.custom("Maven Pro", size: 12))
                    .opacity(0.5)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .font(Font.custom("Maven Pro", size: 16))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
            .padding(.trailing, 15)
            
            Text("+\(post.xp)")
                .font(Font.custom("Maven Pro", size: 20).bold())
            Image(systemName: "chevron.right")
                .foregroundStyle(Color(.appGray))
        }
    }
}
