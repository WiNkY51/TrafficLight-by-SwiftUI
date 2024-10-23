//
//  ContentView.swift
//  TrafficLight
//
//  Created by Winky51 on 23.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    private let isOn: Double = 1
    private let isOff: Double = 0.2
    
    @State private var currentLight: CurrentLight = .red
    @State private var greenLight: Double = 0.2
    @State private var yellowLight: Double = 0.2
    @State private var redLight: Double = 0.2
    
    @State private var tapCount: Int = 0
    @State private var buttonStrokeColor: Color = .gray
    
   
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                TrafficLightColor(color: .red, toggle: redLight)
                
                TrafficLightColor(color: .yellow, toggle: yellowLight)
                
                TrafficLightColor(color: .green, toggle: greenLight)
                
                Spacer()
                
                Button { toggleColors() } label: {
                    
                    Text("Tap count: \(tapCount)")
                        .foregroundStyle(buttonStrokeColor)
                        .font(.largeTitle)
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
                .shadow(color: buttonStrokeColor, radius: 15)
                .overlay {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color(buttonStrokeColor),lineWidth: 2)
                }
   
            }
            .padding()
        }
    }
    
    private func toggleColors() {
        tapCount += 1
        
        switch currentLight {
            case .red:
                greenLight = isOff
                redLight = isOn
                currentLight = .yellow
                buttonStrokeColor = .red
            case .yellow:
                redLight = isOff
                yellowLight = isOn
                currentLight = .green
                buttonStrokeColor = .yellow
            case .green:
                greenLight = isOn
                yellowLight = isOff
                currentLight = .red
                buttonStrokeColor = .green
        }
    }
}

extension ContentView {
    private enum CurrentLight {
        case red, yellow, green
    }
}

#Preview {
    ContentView()
}
