//
//  CharacterService.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import Foundation

class CharacterListClass : FetchDataProtocol, ObservableObject {
    @Published var allCharacterList: [CharacterDetail]? = []
   
    func fetchData() async -> [CharacterDetail]? {
        do {
            let character: Character = try await APIService.shared.fetchMyMockedData(file: MockDataFile.mockedCharacterList, model: Character.self)
           
            await MainActor.run {
                self.allCharacterList = character.docs ?? [CharacterDetail]()
            }
        } catch {
            await MainActor.run {
                self.allCharacterList = []
            }
            print("Error fetching data: \(error.localizedDescription)")
        }
            return self.allCharacterList
    }
}
