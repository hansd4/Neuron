//
//  PostViewModel.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/14/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class PostViewModel: ObservableObject {
    @Published var postUser: User? = nil
    @Published var post: Post
    
    @Published var addingComment: Bool = false
    @Published var commentField: String = ""
    
    init(post: Post) {
        self.post = post
    }
    
    func fetchUser() {
        let db = Firestore.firestore()
        db.collection("users").document(post.authorID).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                print("error", error ?? "")
                return
            }
            
            DispatchQueue.main.async {
                self?.postUser = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    pfp: data["pfp"] as? String ?? "",
                    OSIS: data["OSIS"] as? String ?? "",
                    currentClasses: data["currentClasses"] as? [String] ?? [],
                    tutorClasses: data["tutorClasses"] as? [String:[String:Double]] ?? [:],
                    posts: data["posts"] as? [String] ?? [])
            }
        }
    }
    
    func postComment() {
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        post.addComment(Comment(authorID: userID, postDate: Date.now, text: commentField))
        
        if let postID = post.id {
            let db = Firestore.firestore()
            let postRef = db.collection("posts").document(postID)
            do {
                try postRef.setData(from: post)
            } catch {
                print(error)
            }
        }
        addingComment = false
    }
    
    func solutionAchieved(by commenterID: String) {
        // increment comment author xp
        //     get & write to author object
        // get & write to post object
        let db = Firestore.firestore()
        db.collection("users").document(post.authorID).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                print("error", error ?? "")
                return
            }
            
            DispatchQueue.main.async {
                var commenter = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    pfp: data["pfp"] as? String ?? "",
                    OSIS: data["OSIS"] as? String ?? "",
                    currentClasses: data["currentClasses"] as? [String] ?? [],
                    tutorClasses: data["tutorClasses"] as? [String:[String:Double]] ?? [:],
                    posts: data["posts"] as? [String] ?? [])
                
                commenter.tutorClasses[(self?.post.course)!]?["xp"]! += Double((self?.post.xp)!)
                db.collection("users")
                    .document(commenterID)
                    .setData(commenter.asDictionary())
            }
        }
        
        var postCopy = post
        postCopy.findSolution()
        db.collection("posts")
            .document(postCopy.id!)
            .setData(postCopy.asDictionary())
    }
}
