//
//  DataController.swift
//  users
//
//  Created by Executive on 17/01/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "UserModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!! WUHUU!!!")
        }
        catch {
            print("We could not save the data...")
        }
    }
    
    func addUser(completeName: String, email: String, password: String, context: NSManagedObjectContext) {
        
        let user = User(context: context)
        
        user.id = UUID()
        user.date = Date()
        user.completeName = completeName
        user.email = email
        user.password = password
        
        save(context: context)
    }
    
    
    func editUser(user: User, completeName: String, email: String, password: String, context: NSManagedObjectContext) {
        
        user.date = Date()
        user.completeName = completeName
        user.email = email
        user.password = password
        
        save(context: context)
    }
    
    func deleteUser(user: [User], offsets: IndexSet, context: NSManagedObjectContext) {
        user.forEach(context.delete)
        
        save(context: context)
    }
}
