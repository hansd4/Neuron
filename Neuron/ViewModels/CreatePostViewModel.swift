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

@MainActor class CreatePostViewModel: ObservableObject {
    @Published var authorID = ""
    @Published var postDate = Date()
    @Published var course = ""
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
        let post = Post(authorID: authorID,
                        postDate: Date(),
                        course: course,
                        title: title,
                        description: description,
                        picture: picture,
                        comments: comments)
        
        let db = Firestore.firestore()
        let collectionRef = db.collection("posts")
        do {
            try collectionRef.addDocument(from: post)
        } catch {
            print(error)
        }
    }
    
    private func storePicture() -> String? {
        let store = Storage.storage()
        
        let ref = store.reference(withPath: UUID().uuidString)
        guard let data = picData else { return nil }
        var picURL: String? = nil
        ref.putData(data, metadata: nil) { _, err in
            if let err = err {
                return
            }
            
            ref.downloadURL { url, err in
                if let err = err {
                    return
                }
                
                if let url = url {
                    picURL = url.absoluteString
                }
            }
        }
        return picURL
    }
}
