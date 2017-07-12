//
//  ExpenseCell.swift
//  Expense Manager
//
//  Created by mohanesh-1609 on 12/07/17.
//  Copyright © 2017 PSM. All rights reserved.
//

import Foundation
import UIKit

class ExpenseCell: UITableViewCell {
    
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var expenseDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
