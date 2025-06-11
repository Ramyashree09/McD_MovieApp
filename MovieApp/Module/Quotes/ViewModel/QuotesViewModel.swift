//
//  QuotesViewModel.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import Foundation

class QuotesViewModel<T: FetchDataProtocol>: BaseViewModel where T.DataType == QuotesDetail {
    @Published var allQuotesList : [QuotesDetail] = []
    @Published var filteredQuotesList : [QuotesDetail] = []
    private let quotesUseCase: FetchDataUseCase<T>
    
    init(quotesUseCase: FetchDataUseCase<T>) {
        self.quotesUseCase = quotesUseCase
    }
    
    func fetchQuotesList() async  {
        do {
            await MainActor.run {
                self.isLoading = true
            }
            let quotes = try await self.quotesUseCase.execute()
            await MainActor.run {
                self.allQuotesList = quotes
                self.isLoading = true
            }
        } catch {
            self.errorMessage = "Could not fetch quotes: \(error.localizedDescription)"
        }
    }
}

extension QuotesViewModel {
    func filterQuotesByID(movieID : String, characterID : String) async-> [QuotesDetail] {
        let filteredQuotes = allQuotesList.filter { quotes in
            quotes.movie == movieID
        }.filter { quote in
            quote.character == characterID
        }
        await MainActor.run {
            self.filteredQuotesList = filteredQuotes
            print("FilteredQuotesList, \(self.filteredQuotesList.count)")
        }
        return filteredQuotesList
    }
}

