//
//  NetworkManager.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/7/25.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidURLRequest
    case requestFailed
    case noConnection
    case noData
}

extension NetworkError:LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Something went wrong."
        case .invalidResponse:
            return "The request failed. Try again."
        case .requestFailed:
            return "Request failed."
        case .invalidURLRequest:
            return "Something went wrong."
        case .noConnection:
            return "No internet connection."
        case .noData:
           return "No data found."
        }
    }
}
