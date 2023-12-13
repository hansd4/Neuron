//
//  NSlider.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import SwiftUI

struct NSlider: View {
    let title: String
    
    @Binding var progress: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(Font.custom("Maven Pro", size: 16).weight(.medium))
                Spacer()
                Text("\(progress * 10, specifier: "%.1f")")
                    .font(Font.custom("Maven Pro", size: 20).weight(.semibold))
            }
            
            ZStack {
                LinearGradient(colors: [
                                   Color(.appLightBlue),
                                   Color(.appDarkBlue)],
                               startPoint: .leading,
                               endPoint: .trailing)
                .mask(Slider(value: $progress, in: 0...1, step: 0.01))

                Slider(value: $progress, in: 0...1, step: 0.01)
                      .opacity(0.05)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 15)
        .padding(.trailing, 10)
    }
}
