//
//  NAttachmentPicker.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import SwiftUI
import PhotosUI

struct NAttachmentPicker: View {
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
                                .frame(width: 320, height: 160)
                                .padding()
                        } else {
                            Image(systemName: "photo.badge.plus.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 320, height: 160)
                                .foregroundStyle(Color(.appBlue))
                                .padding()
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
