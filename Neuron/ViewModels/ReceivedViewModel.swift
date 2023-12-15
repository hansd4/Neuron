//
//  ReceivedViewModel.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/14/23.
//

import Foundation
import FirebaseFirestore

class ReceivedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    var postsByClass: [String: [Post]] {
        refreshPosts()
        var newDict: [String: [Post]] = [:]
        for post in posts {
            if newDict[post.course] != nil {
                newDict[post.course]!.append(post)
            } else {
                newDict[post.course] = [Post]()
                newDict[post.course]!.append(post)
            }
        }
        return newDict
    }
    
    init() {}
    
    func refreshPosts() {
        let db = Firestore.firestore()
        db.collection("posts").getDocuments { [weak self] (snapshot, error) in
            if let error = error {
                print(error)
            } else if let snapshot = snapshot {
                let newPosts = snapshot.documents.compactMap {
                    return try? $0.data(as: Post.self)
                }
                self?.posts = newPosts
            }
        }
    }
}
