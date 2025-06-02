//
//  MockMovieListClass.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

class MockMovieListClass: FetchDataProtocol {
    typealias DataType = MovieDetail
    
    func fetchData() async -> [MovieDetail]? {
        let movieList : [MovieDetail] = [MovieDetail(_id: "5cd95395de30eff6ebccde56", name: "The Lord of the Rings Series", runtimeInMinutes: 558, budgetInMillions: 81, boxOfficeRevenueInMillions : 1120, academyAwardNominations: 2917, academyAwardWins: 30, rottenTomatoesScore: 95)]
        return movieList
    }
}

// Mock of FetchDataUseCase
class MockMovieUseCase: FetchDataUseCase<MockMovieListClass> {
    override func execute() async -> [MovieDetail] {
        return [MovieDetail]()
    }
}
