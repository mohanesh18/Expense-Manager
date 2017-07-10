//
//  ListViewController.swift
//  Expense Tracker
//
//  Created by mohanesh-1609 on 08/07/17.
//  Copyright © 2017 PSM. All rights reserved.
//

import UIKit

var list = ["Buy Milk", "Run 5 miles", "Be clean", "Bath well"];

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
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = list[indexPath.row]
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
        self.myTableView.dataSource = self;
        self.myTableView.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

