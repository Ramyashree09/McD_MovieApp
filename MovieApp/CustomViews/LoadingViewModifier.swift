//
//  LoadingViewModifier.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import SwiftUI

struct LoadingViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .padding()
            Text("Loading...")
                .foregroundColor(.black)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 8)
    }
}
