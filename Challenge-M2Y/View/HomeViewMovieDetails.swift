//
//  ContentView.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 31/01/22.
//

import SwiftUI

/// Here is where all the data is presented on the device screen, I tried to leave the elements componentized, just calling the id of the movie
struct HomeViewMovieDetails: View {
    
    
    var body: some View {
        
        ZStack{
            ScrollView (showsIndicators: false){
                //Top movie Image
                ImageComponent(withId: 634649)
                
                //Movie infos
                MovieInfosComponent(withId: 634649)
                
                //Similar list
                ListViewComponent(withId: 634649)
                    .foregroundColor(.primary)
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewMovieDetails()
            .preferredColorScheme(.dark)
    }
}


