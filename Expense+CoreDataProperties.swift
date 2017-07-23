//
//  Expense+CoreDataProperties.swift
//  Expense Manager
//
//  Created by mohanesh-1609 on 21/07/17.
//  Copyright © 2017 PSM. All rights reserved.
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var amount: Float
    @NSManaged public var category: String?
    @NSManaged public var date: Date
    @NSManaged public var uid: String?

}
