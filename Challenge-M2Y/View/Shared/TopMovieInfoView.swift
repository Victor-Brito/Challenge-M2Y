//
//  MovieInfoView.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 01/02/22.
//

import SwiftUI

struct TopMovieInfoView: View {
    
    @State var isFavMovie = false
    var voteCount: Int
    var popularity: Double
    var title: String
    
    var body: some View {
        VStack(spacing: 15){
            HStack {
                //Title of first movie
                Text(title)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(3)
                
                //Heart Button
                TopButtonLike()
                .padding(.trailing)
            }
            //Movie first infos
            HStack {
                Image(systemName: "suit.heart.fill")

                Text(voteCount > 1000 ? String(format: "%.1fK Likes",Double(voteCount)/1000) : "\(voteCount) Likes")
                    .font(.system(size: 14))
                

                Image(systemName: "play.tv.fill")
                    .padding(.leading)
                Text(String(format: "%.3f Views", popularity))
                    .font(.system(size: 14))
                Spacer()
            }
        }
    }
}

