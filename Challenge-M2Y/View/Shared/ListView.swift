//
//  ListView.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 01/02/22.
//

import SwiftUI

struct ListView: View {
    var title: String
    var year: String
    var posterPath: String
    var genres: String

    
    var body: some View {
        HStack{
            //Movie Image
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(self.posterPath)")){
                imageMovie in
                imageMovie
                .resizable()
                .frame(width: 50)
            }placeholder: {
                ZStack {
                    //Placeholder
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: 60)
                    ProgressView()
                         .progressViewStyle(.circular)
                }
            }
            //Basics infos
            VStack(alignment: .leading){
                Text(title)
                    .bold()
                    .multilineTextAlignment(.leading)
                    
                HStack {
                    Text(year)
                    Text(genres)
                        .lineLimit(1)
                }
                .font(.subheadline)
            }
            .padding(.leading, 10)
            Spacer()
        }
        .frame(height: 80)
    }
}

