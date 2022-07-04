//
//  CircleInformation.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 27/06/22.
//

import SwiftUI

struct CircleInformation: View {
    // Data model
    let data: String
    let label: String
    
    // Pulsing circle animation
    @State private var isAnimating: Bool = false
    @State private var opacityAnimation: CGFloat = 1
    
    var body: some View {
        ZStack {
            
            // First small circle animation
            Circle()
                .fill(Color.main.accentColor.opacity(0.8))
                .scaleEffect(isAnimating ? 2.0 : 0.4)
                .opacity(Double(2 -  opacityAnimation))
                .blur(radius: 5)
                .animation(.linear(duration: 7.5).repeatForever(autoreverses: false), value: isAnimating)
            
            // Second mid circle animation
            Circle()
                .fill(Color.main.accentColor.opacity(0.6))
                .scaleEffect(isAnimating ? 2.5 : 0.8)
                .opacity(Double(2 -  opacityAnimation))
                .blur(radius: 7)
                .animation(.linear(duration: 7.5).repeatForever(autoreverses: false), value: isAnimating)

            
            // Third large circle animation
            Circle()
                .fill(Color.main.accentColor.opacity(0.4))
                .scaleEffect(isAnimating ? 3.5 : 0.9)
                .opacity(Double(2 -  opacityAnimation))
                .blur(radius: 10)
                .animation(.linear(duration: 7.5).repeatForever(autoreverses: false), value: isAnimating)
            
            // Static circle in the center
            Circle()
                .foregroundColor(Color.main.accentColor)
                .blur(radius: 10)
            
            // Data
            VStack(alignment: .center, spacing: 20) {
                Text(data)
                    .font(Font.system(.largeTitle, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.6)
                    .lineLimit(1)
                
                if data != "Unavailable" {
                    
                    Text(label)
                        .font(Font.system(.title3, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.7)
                        .lineLimit(1)
                }
            }
        }
        .padding(20)
        .onAppear {
            
            // Trigger the animation when the view appears
            DispatchQueue.main.async {
                    // Control the opacity animation
                    opacityAnimation = 2
                    // Control the scale animation
                    isAnimating = true
            }
        }
    }
}

struct CircleInformation_Previews: PreviewProvider {
    static var previews: some View {
        CircleInformation(data: "+ 1,928", label: "NEW CASE")
    }
}
