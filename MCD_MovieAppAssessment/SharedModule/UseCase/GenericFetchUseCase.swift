//
//  GenericFetchUseCase.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/2/25.
//

class FetchDataUseCase<T: FetchDataProtocol> {
    let service: T

    init(service: T) {
        self.service = service
    }

     func execute() async throws -> [T.DataType] {
         return try await service.fetchData() ?? []
    }
    
    
}
