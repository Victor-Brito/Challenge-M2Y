//
//  String+SimilarMovies.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 31/01/22.
//

import Foundation

struct SimilarMovie: Decodable{
    var genres_ids: [Int]
    var release_date: String
    var poster_path: String // poster image
    var title: String
}

struct ListSimilarMovies: Decodable{
    var results: [SimilarMovie]
}

