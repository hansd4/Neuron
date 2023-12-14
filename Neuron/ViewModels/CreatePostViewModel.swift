//
//  CreatePostViewModel.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import Foundation

class CreatePostViewModel: ObservableObject {
    @Published var authorID = ""
    @Published var postDate = Date().timeIntervalSince1970
    @Published var course = ""
    @Published var title = ""
    @Published var description = ""
    @Published var picture: String? = ""
    @Published var comments = [Comment]()
    
    init() {}
}
