//
//  ButtonLike.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 01/02/22.
//

import SwiftUI

struct ButtonLike: View {
    
    @State var isFavMovie = false
    
    var body: some View {
        Button {
            isFavMovie.toggle()
        } label: {
            Image(systemName: isFavMovie ? "suit.heart.fill" : "suit.heart")
                .foregroundColor(.primary)
        }
    }
}


