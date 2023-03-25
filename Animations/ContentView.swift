//
//  ContentView.swift
//  Animations
//
//  Created by Rob Ranf on 3/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Spacer()
            Button("Tap Me") {
                // animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
            // .scaleEffect(animationAmount)
            // .blur(radius: (animationAmount - 1) * 3)
            // .animation(.default, value: animationAmount)
            // .animation(.easeOut, value: animationAmount)
            // .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
            // .animation(.easeOut(duration: 2)
            //    .delay(1), value: animationAmount)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
