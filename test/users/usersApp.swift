//
//  usersApp.swift
//  users
//
//  Created by Executive on 17/01/23.
//

import SwiftUI

@main
struct usersApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
