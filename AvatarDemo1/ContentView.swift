//
//  ContentView.swift
//  AvatarDemo1
//
//  Created by Adina Gross on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isHappy = true
    @State private var hungerLevel: Int = 0
    let hungerThreshold = 5  // this threshold makes avatar sad
    let maxHunger = 10 // empty bar
    
    var body: some View {
        VStack {
            Text("Welcome to Avatar Demo")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text(isHappy ? "🙂" : "☹️")
                .font(.system(size: 100))
            
            // Hunger Bar
            VStack(alignment: .leading) {
                Text("Hunger Level")
                    .font(.headline)

                ZStack(alignment: .leading) {
                    // Background Bar
                    Rectangle()
                        .frame(width: 200, height: 20)
                        .opacity(0.3)
                        .foregroundColor(.gray)

                    // Filling Bar
                    Rectangle()
                        .frame(width: CGFloat(200 * (1 - Double(hungerLevel) / Double(maxHunger))), height: 20)
                        .foregroundColor(hungerLevel >= hungerThreshold ? .red : .green)
                        .animation(.easeInOut(duration: 0.3), value: hungerLevel)
                }
                .cornerRadius(5)
            }
            .padding()
            
            Button("Feed 🍎") {
                feedAvatar()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .onAppear {
            startHungerTimer()
        }
    }

// Function to Start Hunger Timer
    func startHungerTimer() {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            if hungerLevel < hungerThreshold {
                hungerLevel += 1
            }
            if hungerLevel >= hungerThreshold {
                isHappy = false
                hungerLevel += 1
                if hungerLevel >= maxHunger {
                    timer.invalidate()
                }
            }
        }
    }

    // Function to Feed the Avatar
    func feedAvatar() {
        hungerLevel = 0
        isHappy = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
