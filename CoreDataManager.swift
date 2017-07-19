//
//  CoreDataManager.swift
//  Expense Manager
//
//  Created by mohanesh-1609 on 20/07/17.
//  Copyright © 2017 PSM. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager{
    
    func clearDatabase( entity:String ) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //let coord = self.persistentStoreCoordinator
        print("12312312", context)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity )
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
//        do {
//            try coord.executeRequest(deleteRequest, withContext: context)
//        } catch let error as NSError {
//            debugPrint(error)
//        }
    }
    
}
