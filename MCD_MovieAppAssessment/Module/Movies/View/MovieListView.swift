//
//  Untitled.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/29/25.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var viewModel: MovieViewModel<MovieService>
    
    var body: some View {
        
        NavigationView {
            ListView()
                .onAppear {
                    Task {
                        await viewModel.loadMovies()
                    }
                }
            if viewModel.isLoading {
                modifier(LoadingViewModifier())
            }
        }
    }
}

extension MovieListView{
    @ViewBuilder
    private func ListView() -> some View {
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
    }
}
#Preview {
    let movieUseCase = FetchDataUseCase(service: MovieService())
    MovieListView(viewModel: MovieViewModel(movieUseCase: movieUseCase))
}
