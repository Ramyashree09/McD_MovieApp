//
//  Constants.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import SwiftUICore
import UIKit

struct APIConstants {
    static private let baseURL = "https://e21a086a-4f08-425a-b99c-a9bbe7539a40.mock.pstmn.io/v2/"
    static let movie = APIConstants.baseURL + "movie"
    static let characters = APIConstants.baseURL + "character"
    static let quotes = APIConstants.baseURL + "quote"
}

struct AppColors {
    
    static private let bgGradient = LinearGradient(colors: [.cyan, .gray.opacity(0.6) ], startPoint: .topLeading , endPoint: .bottomTrailing)
    //static private let bgGradient = UIColor.cyan
    static let green = UIColor.green
    static let cyan = UIColor.cyan
    static let appTheme = bgGradient
}

struct MockDataFile {
    static let mockedMovieList = "MockMovieList.json"
    static let mockedCharacterList = "MockCharacterList.json"
    static let mockedQuotesListList = "MockQuotesList.json"
}
