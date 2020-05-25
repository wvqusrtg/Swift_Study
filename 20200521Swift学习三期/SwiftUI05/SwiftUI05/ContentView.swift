//
//  ContentView.swift
//  SwiftUI05
//
//  Created by nixs on 2020/5/25.
//  Copyright © 2020 nixs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var rectangleColor = Color(.green)
    @State var rectangleOffset: CGSize = .zero
    @State var rectangleScaleEffect: CGFloat = CGFloat(1)
    
    var body: some View {
        Text("Hello, World!")
            .frame(width: UIScreen.main.bounds.width-20, height: 50, alignment: Alignment.top)
            .foregroundColor(.red)
        
        // TapGesture creation
        let tapGesture = TapGesture()
                // Change color when tap ended
                .onEnded { _ in
                    if self.rectangleColor == .red {
                        self.rectangleColor = .green
                    } else {
                        self.rectangleColor = .red
                    }
                }
        // LongPressGesture creation
        // Gesture will be handled only if if takes at least 2 seconds
        let longPressGesture = LongPressGesture(minimumDuration: 2, maximumDistance: 10)
                .onEnded { _ in
                    if self.rectangleColor == .red {
                        self.rectangleColor = .green
                    } else {
                        self.rectangleColor = .red
                    }
                }
        // DragGesture creation
        let dragGesture = DragGesture()
                // When drag location is changed we recalculate offset for the rectangle
                .onChanged { value in
                    self.rectangleOffset = value.translation
                }
                // When gesture ended we return the rectangle to the initial position
                .onEnded { _ in
                    self.rectangleOffset = .zero
                }
        // MagnificationGesture creation
        let magnificationGesture = MagnificationGesture()
                // Scale effect recalculation for the rectangle
                .onChanged { value in
                    self.rectangleScaleEffect = value
                }
        return Rectangle()
                // Change color
                .foregroundColor(rectangleColor)
                .cornerRadius(40)
                .frame(width: 200, height: 100, alignment: .center)
                // Add the tapGesture to this view
                .gesture(magnificationGesture)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
