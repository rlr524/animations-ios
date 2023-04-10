//
//  CardDragView.swift
//  Animations
//
//  Created by Rob Ranf on 4/10/23.
//

import SwiftUI

struct CardDragView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .animation(.spring(), value: dragAmount)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged {
                        dragAmount = $0.translation
                    }
                    .onEnded { _ in dragAmount = .zero }
            )
    }
}

struct CardDragView_Previews: PreviewProvider {
    static var previews: some View {
        CardDragView()
    }
}
