//
//  NetworkAPIService.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/6/25.
//

import Foundation

 protocol APIServiceProtocol {
     func fetchMovieRequest(from url:String) throws -> ResponseModel<MovieDetail>
     func fetchCharacterRequest(from url:String) throws -> ResponseModel<CharacterDetail>
     func fetchQuotesRequest(from url:String) throws -> ResponseModel<QuotesDetail>
}
