//
//  Genres.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 31/01/22.
//

struct Genres: Decodable{
    var name: String
    var id: Int
}

struct ListGenres: Decodable{
    let genres: [Genres]
}
