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
        
        
        ScrollView (showsIndicators: false){
            //MARK: Top movie
            TopMovieView(posterPath: viewModel.movie?.poster_path ?? "")
            
            //MARK: Movie infos
            MovieInfoView(voteCount: viewModel.movie?.vote_count ?? 0, popularity: viewModel.movie?.popularity ?? 0.0, title: viewModel.movie?.original_title ?? "without title")
                .padding(.leading, 5)
            //TODO: implements navigationLink and similar movies
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            HomeViewMovieDetails(withId: 515195)
                .preferredColorScheme(.dark)
        }
    }
    
}
