//
//  ListViewController.swift
//  Expense Tracker
//
//  Created by mohanesh-1609 on 08/07/17.
//  Copyright © 2017 PSM. All rights reserved.
//

import UIKit

var list = ["Buy Milk", "Run 5 miles", "Be clean", "Bath well"];

class Entry {
    
    let tdate : Date
    let description : String
    let amount: Float
    init(date : Date, desc : String, amnt: Float) {
        self.tdate = date
        self.description = desc
        self.amount = amnt
    }
}

let expensesList = [
    Entry(date: Date(), desc: "Heading 1", amnt: 12.00),
    Entry(date: Date(), desc: "Heading 2", amnt: 22.00),
    Entry(date: Date(), desc: "Heading 3", amnt: 11.00),
    Entry(date: Date(), desc: "Heading 4", amnt: 25.00)
]

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var expenses = [Expense]();
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
        
    }
    @IBAction func updateExpense(segue: UIStoryboardSegue) {
        expenses = Expenses.sharedInstance.expenseData()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: "cell") as! ExpenseCell
        
        let entry = expensesList[indexPath.row]
        cell.expenseDescription?.text = entry.description
        cell.amountLabel.text = "\(entry.amount)"
        cell.dateLabel.text = "\(entry.tdate)"
        
        return cell
    }
    
    
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            list.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.myTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.myTableView.register(ExpenseCell.self, forCellReuseIdentifier: "cell")
        myTableView.dataSource = self;
        myTableView.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

