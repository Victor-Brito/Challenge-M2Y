//
//  MovieInfosComponent.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 02/02/22.
//

import SwiftUI

struct MovieInfosComponent: View {
    
    @ObservedObject var viewModel: ViewModelMovieDetails
    
    init(withId id: Int) {
        self.viewModel = ViewModelMovieDetails(withId: id)
    }
    
    var body: some View {
        TopMovieInfoView(voteCount: viewModel.movie?.vote_count ?? 0, popularity: viewModel.movie?.popularity ?? 0.0, title: viewModel.movie?.original_title ?? "without title")
            .padding(.leading, 5)
    }
}

