//
//  MovieService.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//
import Foundation

public protocol FetchDataProtocol {
    
    associatedtype DataType
       func fetchData() async -> [DataType]?
}

class MovieListClass : FetchDataProtocol, ObservableObject {
    
    typealias DataType = MovieDetail
    
    @Published var movieList: [MovieDetail]? = []
   
    func fetchData() async -> [MovieDetail]? {
        do {
            let movie: Movie = try await APIService.shared.fetchMyMockedData(file: MockDataFile.mockedMovieList, model: Movie.self)
            await MainActor.run {
                self.movieList = movie.docs
            }
        } catch {
            await MainActor.run {
                self.movieList = []
            }
            print("Error fetching data: \(error.localizedDescription)")
        }
            return self.movieList
    }
}



