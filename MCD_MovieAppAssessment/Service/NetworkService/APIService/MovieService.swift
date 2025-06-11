//
//  MovieService.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//
import Foundation

class MovieService : FetchDataProtocol {
    typealias DataType = MovieDetail
    var movieList: [MovieDetail]? = []   
    func fetchData() async throws-> [MovieDetail]? {
        do {
            let movie: ResponseModel = try await
            APIService.shared.fetchRequest(urlString: APIConstants.movie, model: ResponseModel<MovieDetail>.self)
            print("Fetched movie from API: \(movie)")//debugging
            self.movieList = movie.docs
        } catch {
            self.movieList = []
            throw NetworkError.noData
        }
            return self.movieList
    }
}



