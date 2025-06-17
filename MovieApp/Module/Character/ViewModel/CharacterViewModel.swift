//
//  CharacterViewModel.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import Foundation

class CharacterViewModel<T: FetchDataProtocol, U : FetchDataProtocol>: BaseViewModel where T.DataType == CharacterDetail, U.DataType == QuotesDetail {
    @Published var allQuotesList : [QuotesDetail] = []
    @Published var allCharactersList : [CharacterDetail] = []
    @Published var filteredCharacterList : [CharacterDetail] = []
    @Published var paginationCharcterListArry : [CharacterDetail] = []
    @Published var errorText: String?
    var currentPage = 2
    let itemsPerPage = 5
    private let characterUseCase: FetchDataUseCase<T>
    private let quotesUseCase: FetchDataUseCase<U>
    
    init(characterUseCase: FetchDataUseCase<T>, quotesUseCase: FetchDataUseCase<U>) {
        self.characterUseCase = characterUseCase
        self.quotesUseCase = quotesUseCase
    }
    
    func onLoad() {
        Task {
            try await fetchQuotesList()
        }
    }
    
    func fetchCharactersList() async throws {
        await MainActor.run {
            self.isLoading = true
        }
        let characters = try await self.characterUseCase.execute()
        await MainActor.run {
            self.allCharactersList = characters
            self.isLoading = false
        }
    }
    
    func fetchQuotesList() async throws{
        await MainActor.run {
            self.isLoading = true
        }
        let quotes =  try await self.quotesUseCase.execute()
        await MainActor.run {
            self.allQuotesList = quotes
            self.isLoading = false
        }
    }
}

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
                } else {
                    self.errorText = Constants.noCharcaters
                }
            }
            return filteredCharacterList
        } catch {
            self.errorMessage = "Could not load Characters: \(error.localizedDescription)"
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

