//
//  QuotesViewModelTests.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/2/25.
//

import XCTest
@testable import MCD_MovieAppAssessment

final class QuotesViewModelTests: XCTestCase {

    var sut: QuotesViewModel<MockQuotesListClass>!
    //var mockUseCase: MockQuotesUseCase!
    
    override func setUp() {
        super.setUp()
        sut = QuotesViewModel<MockQuotesListClass>(quotesUseCase: FetchDataUseCase(service: MockQuotesListClass()))
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testQuoteCreation() {
        //When
        let quote = QuotesDetail.init(_id: "1", dialog: "Well, I'm back.", movie: "", character: "", id: "")
        //Then
        XCTAssertNotNil(quote.dialog)
        XCTAssertEqual(quote.dialog, "Well, I'm back.")
        XCTAssertNotNil(quote.dialog)
    }
    
    func test_filterQuotesbyMovieID_SuccessCase() async {
   
        await sut.fetchQuotesList()
        
        let result = await sut.filterQuotesByID(movieID: "5cd95395de30eff6ebccde5d", characterID: "5cd99d4bde30eff6ebccfe2e")
        
        XCTAssertNotNil(sut.filteredQuotesList)
        XCTAssertEqual(result.count, 30 )
    }
    
    func test_filterQuotesbyMovieID_FailureCase() async {
   
        await sut.fetchQuotesList()
        
        let result = await sut.filterQuotesByID(movieID: "5cd95395de30eff6ebccde5", characterID: "5cd99d4bde30eff6ebccfe2e")
        
        XCTAssertNotNil(sut.filteredQuotesList)
        XCTAssertEqual(result.count, 0)
    }
}
