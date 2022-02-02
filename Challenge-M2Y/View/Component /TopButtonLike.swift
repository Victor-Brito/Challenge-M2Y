//
//  ButtonLike.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 01/02/22.
//

import SwiftUI

struct TopButtonLike: View {
    
    @State var isFavMovie = false
    
    private let animationDuration: Double = 0.1
    private var animationScale: CGFloat {
        isFavMovie ? 0.7 : 1.3
    }
    
    @State private var animate = false
    
    var body: some View {
        Button(action: {
            self.animate = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDuration, execute: {
                self.animate = false
                self.isFavMovie.toggle()
            })
        }, label: {
            Image(systemName: isFavMovie ? "suit.heart.fill" : "suit.heart")
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundColor(.primary)
        })
            .scaleEffect(animate ? animationScale : 1)
            .animation(.easeIn(duration: animationDuration), value: animationScale)
    }
}










