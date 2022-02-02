//
//  TopMovieImage.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 01/02/22.
//

import SwiftUI

struct TopMovieImage: View {
    
    /// poster path is the variable that makes an interpolation of strings, where it makes the call of the string that assigns the image of the main "movie"
    var posterPath: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(posterPath)")){
                    topImage in

                if geometry.frame(in: .global).minY <= 0 {
                    //TOPIMAGE
                    topImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: geometry.frame(in: .global).minY/9)
                        .clipped()
                } else {
                    //TOPIMAGE
                    topImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                        .clipped()
                        .offset(y: -geometry.frame(in: .global).minY)

                }
                } placeholder: {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(.circular)
                        .padding(.top)
                }
                FadeGradient()
            }
        }
        
        .frame(height: 350)
    }
}

