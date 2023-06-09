//
//  ContentView.swift
//  Animations
//
//  Created by Rob Ranf on 3/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State var showingBindings = false
    @State var showingExplicitAnimations = false
    @State var showingCardDrag = false
    @State var showingHelloDrag = false
    @State var showingTransitionsView = false
    
    var body: some View {
        VStack {
            Button("Bindings View") {
                self.showingBindings.toggle()
            }
            .padding(20)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Rectangle())
            .sheet(isPresented: $showingBindings) {
                AnimatingBindings()
            }
            
            Spacer()
            
            Button("Explicit Animations View") {
                self.showingExplicitAnimations.toggle()
            }
            .padding(20)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Rectangle())
            .sheet(isPresented: $showingExplicitAnimations) {
                ExplicitAnimationView()
            }
            
            Spacer()
            
            Button("Card Drag View") {
                self.showingCardDrag.toggle()
            }
            .padding(20)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Rectangle())
            .sheet(isPresented: $showingCardDrag) {
                CardDragView()
            }
            
            Spacer()
            
            Section {
                Button("Hello Drag View") {
                    self.showingHelloDrag.toggle()
                }
                .padding(20)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Rectangle())
                .sheet(isPresented: $showingHelloDrag) {
                    HelloDragView()
                }
                
                Spacer()
                
                Button("Transitions View") {
                    self.showingTransitionsView.toggle()
                }
                .padding(20)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Rectangle())
                .sheet(isPresented: $showingTransitionsView) {
                    TransitionsView()
                }
            }
            
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
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
