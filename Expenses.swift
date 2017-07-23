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
    
    func addExpense(amount: Float, date: Date, category: String, uid: String){
        let expense = Expense(context:context)
        expense.amount = Float(amount)
        expense.category = category
        expense.date = date
        expense.uid = uid
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    func removeTask(withUUID: String) {
        
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        
        do {
            let searchResults = try context.fetch(request)
            
            for expense in searchResults {
                
                if expense.uid == withUUID {
                    // delete task
                    context.delete(expense)
                }
            }
            
        } catch {
            print("Error with request: \(error)")
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    func updateTask(uuid: String, isFinished: Bool) {
        
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        
        do {
            let searchResults = try context.fetch(request)
            
            for expense in searchResults {
                if expense.uid == uuid {
                    
                }
            }
            
        } catch {
            print("Error with request: \(error)")
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    func editTask(withUUID: String, category: String, date: Date, amount: Float) {
        
        
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        
        do {
            let searchResults = try context.fetch(request)
            
            for expense in searchResults {
                if expense.uid == withUUID {
                    
                    expense.date = date
                    expense.amount = amount
                    expense.category = category
                    
                }
            }
        } catch {
            print("Error with request: \(error)")
        }
        
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
