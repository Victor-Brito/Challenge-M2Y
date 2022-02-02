//
//  ListViewComponent.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 02/02/22.
//

import SwiftUI

/// Component responsible for showing the similar movies based of main movie in the "view
struct ListViewComponent: View {
    
    @ObservedObject var viewModel: ViewModelMovieDetails
    
    init(withId id: Int) {
        self.viewModel = ViewModelMovieDetails(withId: id)
    }
    
    var body: some View {
        ForEach(viewModel.similarMovies ?? []) {movie in
            ListView(title: movie.title, year: String(movie.release_date.prefix(4)), posterPath: movie.poster_path ?? "", genres: viewModel.getFormattedGenres(ids: movie.genre_ids))
            Divider()
                .foregroundColor(.gray)
                .opacity(0.5)
        }
    }
}

