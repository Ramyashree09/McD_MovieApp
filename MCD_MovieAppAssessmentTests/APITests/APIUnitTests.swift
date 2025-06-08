//
//  CharacterAPIUnitTests.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/7/25.
//

import XCTest
@testable import MCD_MovieAppAssessment

final class CharacterAPIUnitTests: XCTestCase {
    //MARK: - Properties
    var sut_character = MockCharacterListClass()
    var sut_quotes =  MockQuotesListClass()
    var sut_movies = MockMovieListClass()
    
    func testMovieAPI_WhenSuccess()  throws {
        let mockService = MockMovieListClass()
        guard let fetchData = try? mockService.fetchData() else { return }
        mockService.result = .success(fetchData)
        try? sut_movies.fetchData()
        print("MockAPI data:\(mockService.mockMovieList)")
        XCTAssert(!sut_movies.mockMovieList.isEmpty)
    }
    
    func testMovieAPI_WhenFailure()  {
        let mockService = MockMovieListClass()
        mockService.result = .failure(.noData)
        XCTAssert(sut_movies.mockMovieList.isEmpty)
    }
    
    func testCharcaterAPI_WhenSuccess()  throws {
        let mockService = MockCharacterListClass()
        guard let fetchData = try? mockService.fetchData() else { return }
        mockService.result = .success(fetchData)
        try? sut_character.fetchData()
        print("MockAPI data:\(mockService.mockCharacterList)")
        XCTAssert(!sut_character.mockCharacterList.isEmpty)
    }
    
    func testCharcaterAPI_WhenFailure()  {
        let mockService = MockCharacterListClass()
        mockService.result = .failure(.noData)
        XCTAssert(sut_character.mockCharacterList.isEmpty)
    }
    
    func testQuotesAPI_WhenSuccess()  throws {
        let mockService = MockQuotesListClass()
        guard let fetchData = try? mockService.fetchData() else { return }
        mockService.result = .success(fetchData)
        try? sut_quotes.fetchData()
        print("MockAPI data:\(mockService.mockQuotesList)")
        XCTAssert(!sut_quotes.mockQuotesList.isEmpty)
    }
    
    func testQuotesAPI_WhenFailure()  {
        let mockService = MockQuotesListClass()
        mockService.result = .failure(.noData)
        XCTAssert(sut_quotes.mockQuotesList.isEmpty)
    }
}

