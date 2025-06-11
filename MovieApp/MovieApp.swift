//
//  ContentView.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/29/25.
//

import SwiftUI

@main
struct MCD_MovieAppAssessmentApp: App {
    let movieUseCase = FetchDataUseCase(service: MovieService())
    
    init() {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)// Set your color
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
            UINavigationBar.appearance().compactAppearance = navBarAppearance
            UINavigationBar.appearance().tintColor = .black // For back button, etc.
        }
    
    var body: some Scene {
        WindowGroup {
            MovieListView(viewModel: MovieViewModel(movieUseCase: movieUseCase) )
        }
    }
}
