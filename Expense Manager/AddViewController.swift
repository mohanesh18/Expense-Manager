//
//  AddViewController.swift
//  Expense Manager
//
//  Created by mohanesh-1609 on 09/07/17.
//  Copyright © 2017 PSM. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var input: UITextField!
    
    @IBAction func addItem(_ sender: AnyObject) {
        addItemToList()
    }
    func addItemToList(){
        if(input.text != ""){
            list.append(input.text!)
            input.text = ""
        }
        print(list)
        input.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        addItemToList()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        input.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
