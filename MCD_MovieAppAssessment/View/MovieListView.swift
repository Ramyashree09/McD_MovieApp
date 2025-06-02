//
//  Untitled.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/29/25.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel: MovieViewModel<MovieListClass>
    
    init() {
        let movieUseCase = FetchDataUseCase(service: MovieListClass())
        _viewModel = StateObject(wrappedValue: MovieViewModel(movieUseCase: movieUseCase))
    }
    
    var body: some View {
 
            NavigationView {
                List(viewModel.movieList ?? [], id: \.self) { movie in
                    NavigationLink {
                        CharacterView(movieDetail: movie)
                    } label: {
                        Text(movie.name)
                            .foregroundColor(.black)
                    }
                    .listRowBackground(AppColors.appTheme)
                    .frame(height: 40)
                }
                .listRowSpacing(10)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Movies")
                            .font(.largeTitle)
                            .bold()
                    }
                }
                .onAppear {
                    Task {
                        await viewModel.loadMovies()
                    }
                }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

#Preview {
    MovieListView()
}
