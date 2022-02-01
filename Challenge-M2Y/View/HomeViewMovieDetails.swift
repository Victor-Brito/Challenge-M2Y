//
//  ContentView.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 31/01/22.
//

import SwiftUI

struct HomeViewMovieDetails: View {
    
    @ObservedObject var viewModel: ViewModelMovieDetails
    
    init(withId id: Int) {
        self.viewModel = ViewModelMovieDetails(withId: id)
    }
    
    var body: some View {
        
        ZStack{
            ScrollView (showsIndicators: false){
                //Top movie Image
                TopMovieImage(posterPath: viewModel.movie?.poster_path ?? "")
                
                
                
                //Movie infos
                MovieInfoView(voteCount: viewModel.movie?.vote_count ?? 0, popularity: viewModel.movie?.popularity ?? 0.0, title: viewModel.movie?.original_title ?? "without title")
                    .padding(.leading, 5)
                
                //Similar list
                ForEach(viewModel.similarMovies ?? []) {movie in
                    ListView(title: movie.title, year: String(movie.release_date.prefix(4)), posterPath: movie.poster_path ?? "", genres: viewModel.getFormattedGenres(ids: movie.genre_ids))
                    Divider()
                        .foregroundColor(.gray)
                        .opacity(0.5)
                }
                .foregroundColor(.primary)
                
            }
            .edgesIgnoringSafeArea(.top)
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewMovieDetails(withId: 515195)
            .preferredColorScheme(.dark)
    }
}


