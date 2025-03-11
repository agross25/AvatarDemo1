//
//  ContentView.swift
//  AvatarDemo1
//
//  Created by Adina Gross on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isHappy = true
    
    var body: some View {
        VStack {
            Text(isHappy ? "🙂" : "☹️")
                .font(.system(size: 100))
            
            Button("Change Mood") {
                isHappy.toggle()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
