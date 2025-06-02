//
//  QuotesService.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//


import Foundation

class QuotesListClass : FetchDataProtocol, ObservableObject {
    typealias DataType = QuotesDetail
    @Published var quotesList: [QuotesDetail] = []
    func fetchData() async -> [QuotesDetail]? {
        do {
            let quotes: Quotes = try await APIService.shared.fetchMyMockedData(file: MockDataFile.mockedQuotesListList, model: Quotes.self)
            
            await MainActor.run {
                self.quotesList = quotes.docs ?? [QuotesDetail]()
            }
        } catch {
            await MainActor.run {
                self.quotesList = []
            }
            print("Error fetching data: \(error.localizedDescription)")
        }
            return self.quotesList
    }
}
