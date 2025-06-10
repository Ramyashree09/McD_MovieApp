//
//  NetworkAPIService.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/10/25.
//

import Foundation

public protocol FetchDataProtocol {
    
    associatedtype DataType
       func fetchData() async throws-> [DataType]?
}
