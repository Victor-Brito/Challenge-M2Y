//
//  CardsMovies.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 31/01/22.
//

import SwiftUI


/// previously created request and decodes its response to the type of T
class ViewModelMovieDetails: ObservableObject {

   
    @Published var similarMovies: [SimilarMovie]?
    @Published var movie: Movie?
    private var allGenres: [Int: String] = [:]
    
    /// Here the id is initialized to search for movies, genres and similar movies through the started id, as well as information and image of the selected movie
    /// - Parameter id: id to find movies specs
    init(withId id: Int) {
        self.getMovie(id: id)
        self.getSimilarMovies(id: id)
        self.getGenres()
    }
    
    /// This is where the movie is stored so that it can be selected in the view
    /// - Parameter id: id to find movie
    private func getMovie(id: Int) {
        let urlGetMovie = "https://api.themoviedb.org/3/movie/\(id)?api_key=e331ec9230dc9f7a0edeb496b1a3a230"
        API().getObject(url: urlGetMovie) { (result: Result<Movie, Error>) in
            switch result{
            case .success(let movie):
                self.movie = movie
            case .failure:
                self.movie = nil
            }
        }

    }
    
    /// This is where simmilar movies is stored based on main movie id
    /// - Parameter id: id to find similar main movie
    private func getSimilarMovies(id: Int) {
        let urlGetSimilarMovie = "https://api.themoviedb.org/3/movie/\(id)/similar?api_key=e331ec9230dc9f7a0edeb496b1a3a230"
        API().getObject(url: urlGetSimilarMovie) { (list: Result<ListSimilarMovies, Error>) in
            switch list{
            case .success(let movie):
                self.similarMovies = movie.results
            case .failure:
                self.movie = nil
            }
            
        }
        

    }
    
    private func getGenres() {
        let urlGenres = "https://api.themoviedb.org/3/genre/movie/list?api_key=e331ec9230dc9f7a0edeb496b1a3a230&language=en-US"
        API().getObject(url: urlGenres) { (result: Result<ListGenres, Error>) in
            switch result{
            case .success(let list):
                list.genres.forEach { genre in
                    self.allGenres[genre.id] = genre.name
                }
            case .failure:
                self.allGenres = [:]
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

