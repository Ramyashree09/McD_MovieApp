//
//  FeatureFlag.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/2/25.
//

import SwiftUI

class FeatureFlagClass {
    static let shared = FeatureFlagClass()
    @State var isQuotesFeatureEnabled: Bool = true
}
