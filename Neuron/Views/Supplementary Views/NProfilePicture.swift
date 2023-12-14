//
//  NProfilePicture.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct NProfilePicture: View {
    let url: String
    let size: Int
    
    var body: some View {
        WebImage(url: URL(string: url))
            .resizable()
            .scaledToFill()
            .frame(width: CGFloat(size), height: CGFloat(size))
            .clipped()
            .clipShape(Circle())
            .overlay(Circle()
                .stroke(Color(.appGray), lineWidth: 2))
            .shadow(radius: 2)
            .padding()
    }
}
