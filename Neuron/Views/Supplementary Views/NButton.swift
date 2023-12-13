//
//  NButton.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import SwiftUI

struct NButton: View {
    let title: String
    let background: Color
    let foreground: Color
    let action: () -> Void
    
    init(title: String, background: Color, foreground: Color = .white, action: @escaping () -> Void) {
        self.title = title
        self.background = background
        self.foreground = foreground
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 3)
                    .foregroundStyle(background)
                    .frame(maxWidth: .infinity, maxHeight: 35)
                
                Text(title)
                    .foregroundStyle(foreground)
                    .font(Font.custom("Maven Pro", size: 16).weight(.medium))
            }
        }
    }
}

#Preview {
    NButton(title: "Title",
            background: .blue) {
        
    }
}
