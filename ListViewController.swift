//
//  ListViewController.swift
//  Expense Tracker
//
//  Created by mohanesh-1609 on 08/07/17.
//  Copyright © 2017 PSM. All rights reserved.
//

import UIKit

//var list = ["Buy Milk", "Run 5 miles", "Be clean", "Bath well"];

class Entry {
    
    let tdate : Date
    let category : String
    let amount: Float
    init(date : Date, desc : String, amnt: Float) {
        self.tdate = date
        self.category = desc
        self.amount = amnt
    }
}

//let expensesList = [
//    Entry(date: Date(), desc: "Heading 1", amnt: 12.00),
//    Entry(date: Date(), desc: "Heading 2", amnt: 22.00),
//    Entry(date: Date(), desc: "Heading 3", amnt: 11.00),
//    Entry(date: Date(), desc: "Heading 4", amnt: 25.00)
//]
let coreDataInstance = CoreDataManager()

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var expenses = [Expense]();
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
        
    }
    @IBAction func updateExpense(segue: UIStoryboardSegue) {
        expenses = Expenses.sharedInstance.expenseData()
    }
    func getData() {
        //coreDataInstance.clearDatabase(entity: "Expense");
        // get task data
        expenses = Expenses.sharedInstance.expenseData()
        self.myTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if expenses.count == 0 {
            
            let noDataLabel: UILabel     =  UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text             = "No expenses. Add new"
            noDataLabel.textColor        = UIColor.gray
            noDataLabel.textAlignment    = .center
            noDataLabel.numberOfLines    = 3
            tableView.backgroundView = noDataLabel
        }

        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return expenses.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: "cell") as! ExpenseCell
        
        let entry = expenses[indexPath.row]
        cell.expenseDescription.text = entry.category
        cell.amountLabel.text = "\(entry.amount)"
        //cell.dateLabel.text = "\(entry.date)"
        
        cell.dateLabel.text = dateString(date: expenses[indexPath.row].date as! Date)
        return cell
    }
    
    func dateString(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy, hh:mm"
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
    
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            let expense = expenses[indexPath.row]
            Expenses.sharedInstance.removeTask(withUUID: expense.uid!)
            
            //animation
            expenses.remove(at: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: .fade)
            getData()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        getData();
        //self.myTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.myTableView.register(ExpenseCell.self, forCellReuseIdentifier: "cell")
        myTableView.dataSource = self;
        myTableView.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
        getData();
        //coreDataInstance.clearDatabase(entity: "Expense");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

