//
//  ButtonLikeAnimation.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 02/02/22.
//

import SwiftUI

struct ButtonLikeAnimation: View {
    
    @Binding var isLiked: Bool
    
    private let animationDuration: Double = 0.1
    private var animationScale: CGFloat {
        isLiked ? 0.7 : 1.3
    }
    
    @State private var animate = false
    
    var body: some View {
        Button(action: {
            self.animate = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDuration, execute: {
                self.animate = false
                self.isLiked.toggle()
        })
        }, label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .foregroundColor(isLiked ? .white : .gray)
        })
            .scaleEffect(animate ? animationScale : 1)
            .animation(.easeIn(duration: animationDuration))
    }
}

