//
//  CharacterViewModel.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import Foundation

class CharacterViewModel<T: FetchDataProtocol, U : FetchDataProtocol>: ObservableObject where T.DataType == CharacterDetail, U.DataType == QuotesDetail {
    @Published var allQuotesList : [QuotesDetail] = []
    @Published var allCharactersList : [CharacterDetail] = []
    @Published var filteredCharacterList : [CharacterDetail] = []
    @Published var paginationCharcterListArry : [CharacterDetail] = []
    @Published var isLoading: Bool = true
    var currentPage = 2
    let itemsPerPage = 5
    private let characterUseCase: FetchDataUseCase<T>
    private let quotesUseCase: FetchDataUseCase<U>

    init(characterUseCase: FetchDataUseCase<T>, quotesUseCase: FetchDataUseCase<U>) {
        self.characterUseCase = characterUseCase
        self.quotesUseCase = quotesUseCase
        Task {
            await fetchQuotesList()
        }
    }
    
    func fetchCharactersList() async {
        await MainActor.run {
            self.isLoading = true
        }
        let characters = await self.characterUseCase.execute()
            
        await MainActor.run {
                self.allCharactersList = characters
                self.isLoading = false
            }
        }
    
    func fetchQuotesList() async {
      
        await MainActor.run {
            self.isLoading = true
        }
        let quotes = await self.quotesUseCase.execute()
            
        await MainActor.run {
            self.allQuotesList = quotes
                self.isLoading = false
            }
    }
}
