//
//  DataController.swift
//  PeopleApp
//
//  Created by Charles Pink on 2022-07-24.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "People")
    
    
    init(){
        container.loadPersistentStores{ desciption, error in
            if let error = error{
                print("Core Data failed in to load: \(error.localizedDescription)")
            }
        }
    }
    
}
