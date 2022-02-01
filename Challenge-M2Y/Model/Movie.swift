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
    var vote_count: Int // ammount of likes
    var poster_path: String? // poster image
    var backdrop_path: String? // image
    var popularity: Double
    var original_title: String
}
