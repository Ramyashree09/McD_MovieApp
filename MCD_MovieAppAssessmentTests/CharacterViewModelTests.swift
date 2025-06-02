//
//  CharacterViewModelTests
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/2/25.
//

import XCTest
@testable import MCD_MovieAppAssessment

final class CharacterViewModelTests: XCTestCase {
    var sut: CharacterViewModel<MockCharacterListClass, MockQuotesListClass>!
    var mockUseCase: MockMovieUseCase!
    
    override func setUp() {
        super.setUp()
        sut = CharacterViewModel<MockCharacterListClass, MockQuotesListClass>(characterUseCase:  FetchDataUseCase(service: MockCharacterListClass()), quotesUseCase: FetchDataUseCase(service: MockQuotesListClass()))
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_CheckIfDataIsThere() async {
        await sut.fetchCharactersList()
        
        let result = await sut.filterCharacterByID(movieID: "5cd95395de30eff6ebccde5b")
        
        XCTAssertNotNil(sut.filteredCharacterList.count)
        XCTAssertEqual(result.count, 1)
    }
    

}
