//
//  Movie.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 31/01/22.
//

import SwiftUI

struct Movie: Decodable{
    var release_date: String
    var vote_count: Int // ammount of likes
    var poster_path: String // poster image
    var backdrop_path: String // image
    var genres: [Genres]
    var popularity: Double
    var original_title: String
}

struct Genres: Decodable{
    var name: String
    var id: Int
}
