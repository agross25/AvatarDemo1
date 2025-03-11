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

    
    var body: some View {
        VStack {
            Text("Welcome to Avatar Demo")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text(isHappy ? "🙂" : "☹️")
                .font(.system(size: 100))
            
            Text("Hunger: \(hungerLevel)/\(hungerThreshold)")
                .font(.headline)
                .padding()
            
            Button("Feed Avatar 🍎") {
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
