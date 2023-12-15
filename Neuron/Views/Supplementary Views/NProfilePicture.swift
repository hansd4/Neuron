//
//  NProfilePicture.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct NProfilePicture: View {
    let url: String?
    let size: Int
    let strokeSize: Int
    
    init(url: String?, size: Int, strokeSize: Int = 2) {
        self.url = url
        self.size = size
        self.strokeSize = strokeSize
    }
    
    var body: some View {
        if let url = url {
            WebImage(url: URL(string: url))
                .resizable()
                .scaledToFill()
                .frame(width: CGFloat(size), height: CGFloat(size))
                .clipped()
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(Color(.appGray), lineWidth: CGFloat(strokeSize)))
                .shadow(radius: CGFloat(strokeSize))
                .onAppear {
                    print("Profile picture here! Rendering URL \(url)")
                }
        } else {
            Image("default")
                .resizable()
                .scaledToFill()
                .frame(width: CGFloat(size), height: CGFloat(size))
                .clipped()
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(Color(.appGray), lineWidth: CGFloat(strokeSize)))
                .shadow(radius: CGFloat(strokeSize))
        }
    }
}
