//
//  TrafficLightColor.swift
//  TrafficLightBySwiftUI
//
//  Created by Winky51 on 24.10.2024.
//

import SwiftUI

struct TrafficLightColor: View {
    let color: Color
    let toggle: Double
    var body: some View {
        Circle()
            .foregroundStyle(color)
            .opacity(toggle)
            .overlay(content: {
                
                Circle()
                    .stroke(Color(.darkGray), lineWidth: 2)
            })
            .shadow(color: color, radius: 20)
            .frame(width: 170, height: 170)
    }
}
    #Preview {
        TrafficLightColor(
            color: .red, toggle: 0.5
        )
    }

