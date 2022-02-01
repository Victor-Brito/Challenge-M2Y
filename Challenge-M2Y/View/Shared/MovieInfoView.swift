//
//  MovieInfoView.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 01/02/22.
//

import SwiftUI

struct MovieInfoView: View {
    
    @State var isFavMovie = false
    var voteCount: Int
    var popularity: Double
    var title: String
    
    var body: some View {
        VStack(spacing: 15){
            HStack {
                //MARK: Title of first movie
                Text(title)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(3)
                
                //MARK: Heart Button
                Button {
                    isFavMovie.toggle()
                } label: {
                    Image(systemName: isFavMovie ? "suit.heart.fill" : "suit.heart")
                        .foregroundColor(.primary)
                }
                .padding(.trailing)
            }
            //MARK: Movie Likes and Views
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

struct MovieInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MovieInfoView(voteCount: 2368, popularity: 50.299, title: "Porco Rosso o Último Herói Romântico")
    }
}
