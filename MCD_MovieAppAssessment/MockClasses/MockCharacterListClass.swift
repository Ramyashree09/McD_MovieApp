//
//  MockCharacterListClass.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

class MockCharacterListClass: FetchDataProtocol {
    typealias DataType = CharacterDetail
    
    func fetchData() async -> [CharacterDetail]? {
        let characterList = [CharacterDetail(_id: "5cd99d4bde30eff6ebccfbbe", name: "Adanel"),CharacterDetail(_id: "5cd99d4bde30eff6ebccfea0", name: "Gandalf")]
        return characterList
    }
}

// Mock of FetchDataUseCase
class MockCharacterUseCase: FetchDataUseCase<MockCharacterListClass> {
    override func execute() async -> [CharacterDetail] {
        return [CharacterDetail]()
    }
}
