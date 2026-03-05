//
//  AddExpViewController.swift
//  Expense Tracker
//
//  Created by Aravind Joshi Penumaka on 3/5/26.
//

import UIKit

class AddExpViewController: UIViewController {

    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var categoryField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    @IBOutlet weak var noteField: UITextView!
    
    var expense: Expense?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveFunc(_ sender: Any) {
        let curr = Int(amountField.text!)!
        amountSpent += curr
        if(amountSpent > Budget){
            let alert = UIAlertController(title: "Exceeding Limit", message: "You're expenditure is exceeding the budget limit", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func back(_ sender: UIBarButtonItem){
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
