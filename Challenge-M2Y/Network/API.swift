//
//  API.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 31/01/22.
//

import SwiftUI


class API{
    
    func getObject<T: Decodable>(url: String, completion: @escaping (T) -> Void){
        guard let url = URL(string: url )else{return}
        
        URLSession.shared.dataTask(with: url) {data, _, _ in
            let result = try! JSONDecoder().decode(T.self, from: data!)
            
            completion(result)
            
        }.resume()
    }
}

