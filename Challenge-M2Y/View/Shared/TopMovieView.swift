//
//  TopMovie.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 01/02/22.
//

import SwiftUI

struct TopMovieView: View {
    
    var posterPath: String
    
        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(posterPath)")){
                        topImage in
                    
                    if geometry.frame(in: .global).minY <= 0 {
                        //MARK: TOPIMAGE
                        topImage
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .offset(y: geometry.frame(in: .global).minY/9)
                            .clipped()
                    } else {
                        //MARK: TOPIMAGE
                        topImage
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
            .frame(height: 400)
        }
}

struct TopMovie_Previews: PreviewProvider {
    static var previews: some View {
        TopMovieView(posterPath: "/e7WdOF6j3wB5kFXIEoqGXKmGaTl.jpg")
    }
}
