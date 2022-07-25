//
//  PeopleAppApp.swift
//  PeopleApp
//
//  Created by Charles Pink on 2022-07-24.
//

import SwiftUI

@main
struct PeopleAppApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
