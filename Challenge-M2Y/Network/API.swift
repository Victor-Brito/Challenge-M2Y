//
//  API.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 31/01/22.
//

import SwiftUI


class API{
    
    func getObject<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void){
        guard let url = URL(string: url )else{return}
        
            URLSession.shared.dataTask(with: url) {data, _, _ in
                guard let data = data else {return completion(.failure(ApiError.dataError))}

                let result = try? JSONDecoder().decode(T.self, from: data)
                
                guard let result = result else {return completion(.failure(ApiError.parserError))}
                
                completion(.success(result))
                
            }.resume()
    }
}

