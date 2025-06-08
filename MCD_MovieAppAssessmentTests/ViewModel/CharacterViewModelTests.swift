//
//  CharacterViewModelTests
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/2/25.
//

import XCTest

@testable import MCD_MovieAppAssessment
final class CharacterViewModelTests: XCTestCase {
    //MARK: - Properties
    var sut: CharacterViewModel<MockCharacterListClass, MockQuotesListClass>!
    var quoteModel: QuotesDetail!
    
    override func setUpWithError() throws {
        super.setUp()
        sut = CharacterViewModel<MockCharacterListClass, MockQuotesListClass>(characterUseCase:  FetchDataUseCase(service: MockCharacterListClass()), quotesUseCase: FetchDataUseCase(service: MockQuotesListClass()))
        sut.allCharactersList = [CharacterDetail.init(_id: "1", name: "Arwen",race: "Hobbit", birth: "Before ,TA 1944"), CharacterDetail.init(_id: "2", name: "Boromir")]
    }
    
    override func tearDownWithError() throws{
        // Put teardown code here. This method is called after the invocation of each test method in the class.    }
    }
    func testCharacterCreation() {
        let character = CharacterDetail(_id: "2", name: "Aragorn", race: "Human")
        // Test that the character's name, race, and description are correct
        XCTAssertEqual(character.name, "Aragorn")
        XCTAssertEqual(character.race, "Human")
    }
    
    func testLoadData() {
        //Then
        XCTAssertEqual(sut.allCharactersList.count, 2, "There should be 2 characters")
    }
    func testProperties() {
        //Given
        let character = sut.allCharactersList.first
        //Then
        XCTAssertNotNil(character,"There should be atleast one character.")
        XCTAssertEqual(character?.race, "Hobbit", "Frodo should be Hobbit.")
        XCTAssertNotNil(character?.birth, "Birth should not be nil.")
    }
}

