//
//  Expenses.swift
//  Expense Manager
//
//  Created by mohanesh-1609 on 11/07/17.
//  Copyright © 2017 PSM. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Expenses{
    static let sharedInstance = Expenses()
    
    var expenses = [Expense]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func addExpense(amount: Float, date: Date, category: String){
        let expense = Expense(context:context)
        expense.amount = Float(amount)
        expense.category = category
        expense.date = date as NSDate
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func expenseData() -> [Expense] {
        
        do {
            expenses = try context.fetch(Expense.fetchRequest())
        }catch {
            print("Error fetching data from CoreData")
        }
        
        return expenses
    }
    
}
