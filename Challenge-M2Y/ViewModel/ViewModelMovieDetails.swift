//
//  CardsMovies.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 31/01/22.
//

import SwiftUI


class ViewModelMovieDetails: ObservableObject {

    @Published var movie: Movie?
    @Published var similarMovies: [SimilarMovie]?
    private var allGenres: [Int: String] = [:]

    init(withId id: Int) {
        self.getMovie(id: id)
        self.getSimilarMovies(id: id)
        self.getGenres()
    }

    private func getMovie(id: Int) {
        let urlGetMovie = "https://api.themoviedb.org/3/movie/\(id)?api_key=e331ec9230dc9f7a0edeb496b1a3a230"
        API().getObject(url: urlGetMovie) { (result: Movie) in
            self.movie = result
        }

    }

    private func getSimilarMovies(id: Int) {
        let urlGetSimilarMovie = "https://api.themoviedb.org/3/movie/\(id)/similar?api_key=e331ec9230dc9f7a0edeb496b1a3a230"
        API().getObject(url: urlGetSimilarMovie) { (list: ListSimilarMovies) in
            self.similarMovies = list.results
        }
        

    }

    private func getGenres() {
        let urlGenres = "https://api.themoviedb.org/3/genre/movie/list?api_key=e331ec9230dc9f7a0edeb496b1a3a230&language=en-US"
        API().getObject(url: urlGenres) { (list: ListGenres) in
            list.genres.forEach { genre in
                self.allGenres[genre.id] = genre.name
            }
        }

    }

    func getFormattedGenres(ids: [Int]) -> String {
        if allGenres.isEmpty {
            getGenres()
        }
        var formatedGenres = [String]()
            ids.forEach { id in
                formatedGenres.append(allGenres[id] ?? "")
            }
        
        return formatedGenres.joined(separator: ", ")
    }



}

