//
//  CharacterListClass.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import Foundation

class MockCharacterListClass: FetchDataProtocol {
    typealias DataType = CharacterDetail
    @Published var mockCharacterList = [CharacterDetail]()
    var result: Result<[CharacterDetail], NetworkError>!
    
    func fetchData() throws -> [CharacterDetail]? {
        let characterList = try MockService().decodableObject(forResource: "MockCharacterList", type: ResponseModel<CharacterDetail>.self)
        print("Fectching Mock data:\(characterList)")
        self.mockCharacterList = characterList.docs ?? [CharacterDetail]()
        return mockCharacterList
    }
}

// Mock of FetchDataUseCase
class MockCharacterUseCase: FetchDataUseCase<MockCharacterListClass> {
    override func execute() async -> [CharacterDetail] {
        return [CharacterDetail]()
    }
}
