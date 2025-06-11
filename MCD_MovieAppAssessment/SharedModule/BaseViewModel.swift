//
//  BaseViewModel.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/5/25.
//

import Foundation

 class BaseViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var errorMessage: String = ""
}
