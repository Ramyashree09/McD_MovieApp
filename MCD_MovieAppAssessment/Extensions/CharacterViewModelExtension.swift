//
//  Character.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/2/25.
//

extension CharacterViewModel {
    
    func filterCharacterByID(movieID : String) async -> [CharacterDetail] {
        
        do {
            try await fetchCharactersList()
            
            let filteredQuotes = allQuotesList.filter { $0.movie == movieID }
            let characterListTemp = await MainActor.run {
                allCharactersList.filter { character in
                        filteredQuotes.contains { quote in quote.character == character.id }
                    }.sorted { $0.name < $1.name }
                }
            await MainActor.run {
                filteredCharacterList = characterListTemp
                if filteredCharacterList.count > 0  {
                    let range = filteredCharacterList.count > itemsPerPage ? 0..<itemsPerPage : 0..<filteredCharacterList.count
                    self.paginationCharcterListArry.append(contentsOf: self.filteredCharacterList[range])
                }
            }
            return filteredCharacterList
                } catch {
                   print("Error message")
                }        
        return [CharacterDetail]()
    }
    
    func loadMoreCharacters() async  {

        let startIndex = (currentPage - 1) * itemsPerPage
        let endIndex = min(startIndex + itemsPerPage, self.filteredCharacterList.count)
        
        if startIndex < filteredCharacterList.count  {
            
            await MainActor.run {
                self.paginationCharcterListArry.append(contentsOf: self.filteredCharacterList[startIndex..<endIndex])
                self.currentPage += 1
            }
        }
        }
}
