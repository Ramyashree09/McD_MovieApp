//
//  MockMovieListClass.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import Foundation

class MockMovieListClass: FetchDataProtocol {
    typealias DataType = MovieDetail
    @Published var mockMovieList = [MovieDetail]()
    var result: Result<[MovieDetail], NetworkError>!
    
    func fetchData() throws -> [MovieDetail]? {
        let movieList = try MockService().decodableObject(forResource: "MockMovieList", type: ResponseModel<MovieDetail>.self)
        print("Fectching Mock data:\(movieList)")
        self.mockMovieList = movieList.docs ?? [MovieDetail]()
        return mockMovieList
    }
}

// Mock of FetchDataUseCase
class MockMovieUseCase: FetchDataUseCase<MockMovieListClass> {
    override func execute() async -> [MovieDetail] {
        return [MovieDetail]()
    }
}




