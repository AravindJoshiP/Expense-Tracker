//
//  AddExpViewController.swift
//  Expense Tracker
//
//  Created by Aravind Joshi Penumaka on 3/5/26.
//

import UIKit

class AddExpViewController: UIViewController {

    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    @IBOutlet weak var noteField: UITextView!
    
    @IBOutlet weak var categoryDropdown: UIButton!
    var expense: Expense?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let option1 = UIAction(title: "Food"){ [weak self] action in
            self?.categoryDropdown.setTitle(action.title, for: .normal)
        }
        
        let option2 = UIAction(title: "Drinks"){ [weak self] action in
            self?.categoryDropdown.setTitle(action.title, for: .normal)
        }
        
        let option3 = UIAction(title: "Clothes"){ [weak self] action in
            self?.categoryDropdown.setTitle(action.title, for: .normal)
        }
        
        let option4 = UIAction(title: "Groceries"){ [weak self] action in
            self?.categoryDropdown.setTitle(action.title, for: .normal)
        }
        
        let option5 = UIAction(title: "Education"){ [weak self] action in
            self?.categoryDropdown.setTitle(action.title, for: .normal)
        }
        
        let option6 = UIAction(title: "Housing"){ [weak self] action in
            self?.categoryDropdown.setTitle(action.title, for: .normal)
        }
        // Do any additional setup after loading the view.
        let menu = UIMenu(title: "Choose a Category", children: [option1,option2,option3,option4,option5,option6])
        
        categoryDropdown.menu = menu
        categoryDropdown.showsMenuAsPrimaryAction = true
        
        setupScreen()
        
        // Do any additional setup after loading the view.
    }
    
    func setupScreen() {
        if let exp = expense {
            navigationItem.title = "Edit Expense"
            amountField.text = String(exp.amount)
            categoryDropdown.setTitle(exp.category, for: .normal)
            //categoryDropdown.text = exp.category
            noteField.text = exp.note
            dateField.date = exp.date
        } else {
            navigationItem.title = "Add Expense"
            amountField.text = ""
            noteField.text = ""
            dateField.date = Date()
        }
    }
    
    @IBAction func saveFunc(_ sender: Any) {
        let category = categoryDropdown.titleLabel?.text ?? "default"
        if(amountField.text == ""){
            let alert1 = UIAlertController(title: "Amount cannot be nil", message: "Amount field cannot be nil.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alert1.addAction(ok)
            self.present(alert1, animated: true, completion: nil)
        }
        else{
            let curr = Int(amountField.text!)!
            amountSpent += curr
            let new_expense: Expense = Expense(amount: curr,category: category,date:dateField.date, note: noteField.text)
            expenses.append(new_expense)
            
            switch category{
            case "Food":
                Food.append(new_expense)
            case "Clothes":
                Clothes.append(new_expense)
            case "Drinks":
                Drinks.append(new_expense)
            case "Groceries":
                Groceries.append(new_expense)
            case "Education":
                Education.append(new_expense)
            case "Housing":
                Housing.append(new_expense)
            default:
                print("Error with category!")
            }
            
        }
        
        if(amountSpent > Budget){
            let alert = UIAlertController(title: "Exceeding Limit", message: "You're expenditure is exceeding the budget limit", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
        
        dismiss(animated: true)
        
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
