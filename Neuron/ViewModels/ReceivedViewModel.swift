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
    @Published var postsByClass: [String: [Post]] = [:]
    
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
    
    func updatePostsByClass() {
        refreshPosts()
        
        postsByClass.removeAll()
        for post in posts {
            if postsByClass[post.course] != nil {
                postsByClass[post.course]!.append(post)
            } else {
                postsByClass[post.course] = [Post]()
                postsByClass[post.course]!.append(post)
            }
        }
        
        for course in Array(postsByClass.keys) {
            print(course)
            for post in postsByClass[course]! {
                print("\t\(post.title)")
            }
            print()
        }
    }
}
