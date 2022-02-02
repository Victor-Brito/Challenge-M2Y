//
//  Movie.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 31/01/22.
//

import SwiftUI

struct Movie: Decodable{
    var genres: [Genres]
    var release_date: String
    var vote_count: Int 
    var poster_path: String?
    var backdrop_path: String?
    var popularity: Double
    var original_title: String
}
