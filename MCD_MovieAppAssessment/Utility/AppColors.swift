//
//  AppColorConstants.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/5/25.
//
import SwiftUICore
import UIKit

struct AppColors {    
    static private let bgGradient = LinearGradient(colors: [.cyan, .gray.opacity(0.6) ], startPoint: .topLeading , endPoint: .bottomTrailing)
    static let green = UIColor.green
    static let cyan = UIColor.cyan
    static let appTheme = bgGradient
}

