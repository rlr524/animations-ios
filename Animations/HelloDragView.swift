//
//  HelloDragView.swift
//  Animations
//
//  Created by Rob Ranf on 4/10/23.
//

import SwiftUI

struct HelloDragView: View {
    let letters = Array("Hello Madison")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

struct HelloDragView_Previews: PreviewProvider {
    static var previews: some View {
        HelloDragView()
    }
}
