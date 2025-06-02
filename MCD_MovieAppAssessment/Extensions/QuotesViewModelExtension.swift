//
//  QuotesViewModelExtension.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/2/25.
//
import Foundation

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
