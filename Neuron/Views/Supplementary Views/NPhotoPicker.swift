//
//  NPhotoPicker.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/11/23.
//

import SwiftUI
import PhotosUI

struct NPhotoPicker: View {
    let title: String
    
    @Binding var selection: PhotosPickerItem?
    @Binding var image: Image?
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(alignment: .center) {
                Section {
                    PhotosPicker(selection: $selection, matching: .images) {
                        if let img = image {
                            img
                                .resizable()
                                .scaledToFill()
                                .frame(width: 160, height: 160)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 160, height: 160)
                                .foregroundStyle(Color(.appGray))
                        }
                    }
                    .shadow(radius: selection != nil ? 5 : 0)
                    .padding(.vertical)
                } header: {
                    Text(title)
                        .opacity(0.5)
                        .font(Font.custom("Maven Pro", size: 16))
                }
            }
            
            Spacer()
        }
    }
}

// removed preview due to inability to create binding optional photospickeritem
