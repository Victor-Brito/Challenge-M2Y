//
//  ImageComponent.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 02/02/22.
//

import SwiftUI

/// Component responsible for showing the main movie image in the view
struct ImageComponent: View {
    
    @ObservedObject var viewModel: ViewModelMovieDetails
    
    init(withId id: Int) {
        self.viewModel = ViewModelMovieDetails(withId: id)
    }
    
    var body: some View {
        TopMovieImage(posterPath: viewModel.movie?.poster_path ?? "")
    }
}
