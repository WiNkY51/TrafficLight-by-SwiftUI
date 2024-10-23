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
                Circle()
                    .foregroundStyle(.red)
                    .opacity(redLight)
                    .overlay(content: {
                        
                        Circle()
                            .stroke(Color(.darkGray), lineWidth: 2)
                    })
                    .shadow(color: .red, radius: 20)
                    .frame(width: 170, height: 170)
                
                
                Circle()
                    .foregroundStyle(.yellow)
                    .opacity(yellowLight)
                    .overlay(content: {
                        
                        Circle()
                            .stroke(Color(.darkGray), lineWidth: 2)
                    })
                    .shadow(color: .yellow, radius: 20)
                    .frame(width: 170, height: 170)
                
                Circle()
                    .foregroundStyle(.green)
                    .opacity(greenLight)
                    .overlay(content: {
                        
                        Circle()
                            .stroke(Color(.darkGray), lineWidth: 2)
                    })
                    .shadow(color: .green, radius: 20)
                    .frame(width: 170, height: 170)
                
                Spacer(minLength: 3)
                
                Button { toggleColors() } label: {
                    
                    Text("Tap count: \(tapCount)")
                        .font(.largeTitle)
                        .foregroundStyle(buttonStrokeColor)
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
                .overlay {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color(buttonStrokeColor),lineWidth: 2)
                        .shadow(color: buttonStrokeColor, radius: 20, x: -150, y: 0)
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
