//
//  MCD_MovieAppAssessmentTests.swift
//  MCD_MovieAppAssessmentTests
//
//  Created by Ramyashree S on 5/29/25.
//

import XCTest

@testable import MCD_MovieAppAssessment
final class MCD_MovieAppAssessmentTests: XCTestCase {
    
    var sut: MovieViewModel<MockMovieListClass>!
    var mockService: MockMovieListClass!

    override func setUp() {
        super.setUp()
        let useCase = FetchDataUseCase(service: MockMovieListClass())
        sut = MovieViewModel(movieUseCase: useCase)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_getMovies_SuccessCase() async {
        await sut.loadMovies()
        
        XCTAssertNotNil(sut.movieList)
        XCTAssertEqual(sut.movieList?.count, 1)
        XCTAssertEqual(sut.movieList?.first?.name, "The Lord of the Rings Series")
    }
    
    func test_getMovies_FailureCase() async {
        await sut.loadMovies()
        
        XCTAssertEqual(sut.movieList?.count, 1)
        XCTAssertEqual(sut.movieList?.first?.name, "The Lord of the Rings Series")
        XCTAssertFalse(sut.movieList?.first?.name == "The Lord of the Rings Serie", "Movie name is wrong")
    }
}



