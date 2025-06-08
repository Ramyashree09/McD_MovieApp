//
//  CharacterService.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import Foundation

class CharacterListClass : FetchDataProtocol, ObservableObject {
    @Published var allCharacterList: [CharacterDetail] = []
    
    func fetchData() async throws -> [CharacterDetail]? {
        do {
            let character: ResponseModel = try await
            APIService.shared.fetchRequest(urlString: APIConstants.characters, model: ResponseModel<CharacterDetail>.self)
            print("Fetched character from API response: \(character)")//debugging
            self.allCharacterList = character.docs ?? [CharacterDetail]()
        } catch {
            self.allCharacterList = []
            print("Error fetching data: \(error.localizedDescription)")
        }
        return self.allCharacterList
    }
}
