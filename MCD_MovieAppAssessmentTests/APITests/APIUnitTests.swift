//
//  CharacterAPIUnitTests.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/7/25.
//

import XCTest
@testable import MCD_MovieAppAssessment

final class APIUnitTests: XCTestCase {
    //MARK: - Properties
    var sutCharacter = MockCharacter()
    var sutQuotes =  MockQuotes()
    var sutMovies = MockMovie()
    
    func testMovieAPI_WhenSuccess()  throws {
        let mockService = MockMovie()
        guard let fetchData = try? mockService.fetchData() else { return }
        mockService.result = .success(fetchData)
        try? sutMovies.fetchData()
        print("MockAPI data:\(mockService.mockMovieList)")
        XCTAssert(!sutMovies.mockMovieList.isEmpty)
    }
    
    func testMovieAPI_WhenFailure()  {
        let mockService = MockMovie()
        mockService.result = .failure(.noData)
        XCTAssert(sutMovies.mockMovieList.isEmpty)
    }
    
    func testCharcaterAPI_WhenSuccess()  throws {
        let mockService = MockCharacter()
        guard let fetchData = try? mockService.fetchData() else { return }
        mockService.result = .success(fetchData)
        try? sutCharacter.fetchData()
        print("MockAPI data:\(mockService.mockCharacterList)")
        XCTAssert(!sutCharacter.mockCharacterList.isEmpty)
    }
    
    func testCharcaterAPI_WhenFailure()  {
        let mockService = MockCharacter()
        mockService.result = .failure(.noData)
        XCTAssert(sutCharacter.mockCharacterList.isEmpty)
    }
    
    func testQuotesAPI_WhenSuccess()  throws {
        let mockService = MockQuotes()
        guard let fetchData = try? mockService.fetchData() else { return }
        mockService.result = .success(fetchData)
        try? sutQuotes.fetchData()
        print("MockAPI data:\(mockService.mockQuotesList)")
        XCTAssert(!sutQuotes.mockQuotesList.isEmpty)
    }
    
    func testQuotesAPI_WhenFailure()  {
        let mockService = MockQuotes()
        mockService.result = .failure(.noData)
        XCTAssert(sutQuotes.mockQuotesList.isEmpty)
    }
}

