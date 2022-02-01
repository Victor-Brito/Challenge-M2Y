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
            //MARK: Movie Image
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(self.posterPath)")){
                imageMovie in
                imageMovie
                .resizable()
                .frame(width: 50)
            }placeholder: {
                ZStack {
                    //MARK: Placeholder
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: 60)
                    ProgressView()
                         .progressViewStyle(.circular)
                }
            }
            //MARK: Basics infos
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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(title: "Eternos", year: "2013", posterPath: "/4idevlMxCtcHSwkyZnW4qJaJNwP.jpg", genres: "Ficção científica")
    }
}
