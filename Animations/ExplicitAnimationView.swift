//
//  ExplicitAnimationView.swift
//  Animations
//
//  Created by Rob Ranf on 3/29/23.
//

import SwiftUI

struct ExplicitAnimationView: View {
    @State private var animationAmount = 0.0
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            withAnimation {
                animationAmount += 360
            }
            enabled.toggle()
        }
        .padding(50)
        .background(enabled ? .blue : .red)
        .foregroundColor(.white)
        //.clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.default, value: enabled)
    }
}

struct ExplicitAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimationView()
    }
}
