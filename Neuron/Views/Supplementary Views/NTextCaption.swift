//
//  NTextCaption.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/12/23.
//

import SwiftUI

struct NTextCaption: View {
    let content: String
    
    var body: some View {
        Text(content)
            .font(Font.custom("Maven Pro", size: 12).weight(.thin))
            .opacity(0.5)
            .padding(.vertical)
    }
}

#Preview {
    NTextCaption(content: "This is content. Yes. Yippee.")
}
