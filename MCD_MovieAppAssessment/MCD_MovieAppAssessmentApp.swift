//
//  MCD_MovieAppAssessmentApp.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/29/25.
//

import SwiftUI

@main
struct MCD_MovieAppAssessmentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
