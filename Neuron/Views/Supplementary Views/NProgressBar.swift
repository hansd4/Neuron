//
//  NProgressBar.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/13/23.
//

import SwiftUI

struct NProgressBar: View {
    let title: String
    let xp: Double
    var level: Int {
        var lvl = 1
        var x = 0.0
        while (x < xp) {
            x += 5 * (pow(1.0281, Double(lvl - 1)))
            lvl += 1
        }
        return (lvl - 1)
    }
    var xpRemainder: Double {
        var lvl = 1
        var x = 0.0
        while (x < xp) {
            x += 5 * (pow(1.0281, Double(lvl - 1)))
            lvl += 1
        }
        return xp - (x - 5 * (pow(1.0281, Double(level - 1))))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(Font.custom("Maven Pro", size: 20).weight(.medium))
                Spacer()
                Text("\(level)")
                    .font(Font.custom("Maven Pro", size: 20).weight(.semibold))
            }
            
            ZStack {
                LinearGradient(colors: [
                                   Color(.appLightBlue),
                                   Color(.appDarkBlue)],
                               startPoint: .leading,
                               endPoint: .trailing)
                .mask(ProgressView(value: xpRemainder, total: 5 * (pow(1.0281, Double(level - 1)))))

                ProgressView(value: xpRemainder, total: 5 * (pow(1.0281, Double(level - 1))))
                      .opacity(0.05)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 15)
        .padding(.trailing, 15)
    }
}
