//
//  String+SimilarMovies.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 31/01/22.
//

import Foundation

struct SimilarMovie: Decodable, Identifiable{
    var id: Int
    
    var genre_ids: [Int] //Genre of movie (IDs)
    var release_date: String //Date of release movie
    var poster_path: String? // Movie image
    var title: String //Title of Movie
}

struct ListSimilarMovies: Decodable{

    
    var results: [SimilarMovie]
}

