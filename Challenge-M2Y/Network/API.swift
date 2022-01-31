//
//  API.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 31/01/22.
//

import SwiftUI


class API{
    func getFirstMovie(id: Int, completion: @escaping (Movie) -> ()){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=e331ec9230dc9f7a0edeb496b1a3a230")else{return}
        
        URLSession.shared.dataTask(with: url) {data, _, _ in
            let movies = try! JSONDecoder().decode(Movie.self, from: data!)
            
            DispatchQueue.main.async {
                completion(movies)
            }
            
            
            
        }.resume()
    }
}
