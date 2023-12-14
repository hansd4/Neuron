//
//  CreatePostViewModel.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import Foundation
import SwiftUI
import PhotosUI
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

@MainActor class CreatePostViewModel: ObservableObject {
    @Published var authorID = ""
    @Published var postDate = Date()
    @Published var course = "Other"
    @Published var title = ""
    @Published var description = ""
    @Published var picture: String? = ""
    @Published var comments = [Comment]()
    
    @Published var pickerPicture: PhotosPickerItem? {
        didSet {
            Task {
                guard let item = pickerPicture else { return }
                guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
                guard let uiImage = UIImage(data: imageData) else { return }
                self.picData = Data()
                self.pictureImage = Image(uiImage: uiImage)
            }
        }
    }
    @Published var pictureImage: Image?
    @Published var picData: Data?
    
    init() {}
    
    func post() {
        storePicture()
    }
    
    private func storePicture() {
        let store = Storage.storage()
        
        let ref = store.reference(withPath: UUID().uuidString)
        guard let data = picData else {
            print("Error getting picData: picData was nil")
            self.sendPostToFirebase(url: nil)
            return
        }
        ref.putData(data, metadata: nil) { [weak self] _, err in
            if let err = err {
                print(err)
                self?.sendPostToFirebase(url: nil)
                return
            }
            
            ref.downloadURL { url, err in
                if let err = err {
                    print(err)
                    self?.sendPostToFirebase(url: nil)
                    return
                }
                
                if let url = url {
                    print("Successfully posted image to \(url.absoluteString)")
                    self?.sendPostToFirebase(url: url.absoluteString)
                }
            }
        }
    }
    
    private func sendPostToFirebase(url: String?) {
        let post = Post(authorID: authorID,
                        postDate: Date(),
                        course: course,
                        title: title,
                        description: description,
                        picture: url,
                        comments: comments)
        
        let db = Firestore.firestore()
        let collectionRef = db.collection("posts")
        do {
            try collectionRef.addDocument(from: post)
        } catch {
            print(error)
        }
    }
}
