//
//  PublicTaskListSwiftUICoreDataApp.swift
//  PublicTaskListSwiftUICoreData
//
//  Created by Олег Тарасенко on 10/6/20.
//

import SwiftUI

@main
struct PublicTaskListSwiftUICoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
