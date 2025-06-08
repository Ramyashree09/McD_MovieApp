//
//  Untitled.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import Foundation

class MovieViewModel<T: FetchDataProtocol>: BaseClass where T.DataType == MovieDetail {
    
    @Published var movieList : [MovieDetail]? = nil
    @Published var movieID : String = ""
    private let itemsPerPage = 5
    var currentPage = 1
    //@Published var isLoading : Bool = true
    private let movieUseCase: FetchDataUseCase<T>
    
    init(movieUseCase: FetchDataUseCase<T>) {
        self.movieUseCase = movieUseCase
    }
    
    func loadMovies() async  {
        do {
            await MainActor.run {
                self.isLoading = true
            }
            let result = try await movieUseCase.execute()
            await MainActor.run {
                self.movieList = result
                isLoading = false
            }
        } catch {
            print("Error Message")
        }      }
}
