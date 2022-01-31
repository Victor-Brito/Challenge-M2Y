//
//  MovieDecoder.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 31/01/22.
//

import SwiftUI

extension String{
    
    func load()->UIImage{
        do{
            guard let url = URL(string: self)else{
                return UIImage()
            }
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        }catch{
            
        }
        return UIImage()
    }
}
