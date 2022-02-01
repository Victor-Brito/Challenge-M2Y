//
//  Challenge_M2YApp.swift
//  Challenge-M2Y
//
//  Created by Victor Brito on 31/01/22.
//

import SwiftUI

@main
struct Challenge_M2YApp: App {
    var body: some Scene {
        WindowGroup {
            HomeViewMovieDetails(withId: 11621)
                .preferredColorScheme(.dark)
        }
    }
}
