//
//  MockQuotesListClass.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import Foundation

class MockQuotesListClass: FetchDataProtocol {
    typealias DataType = QuotesDetail
    var mockQuotesList = [QuotesDetail]()
    var result: Result<[QuotesDetail], NetworkError>!
    
    func fetchData() throws -> [QuotesDetail]? {
        let quotesList = try MockService().decodableObject(forResource: "MockQuotesList", type: ResponseModel<QuotesDetail>.self)
        self.mockQuotesList = quotesList.docs ?? [QuotesDetail]()
        print("Fectching Mock data-mockQuotesList:\(mockQuotesList))")
        return mockQuotesList
    }
}

// Mock of FetchDataUseCase
class MockQuotesUseCase: FetchDataUseCase<MockQuotesListClass> {
    override func execute() async -> [QuotesDetail] {
        return [QuotesDetail]()
    }
}

