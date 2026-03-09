//
//  categoryBasedExpensesTableViewController.swift
//  Expense Tracker
//
//  Created by Aravind Joshi Penumaka on 3/6/26.
//

import UIKit

class categoryBasedExpensesTableViewController: UITableViewController {
    
    var cat = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.title = button
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch button{
        case "Food":
            return Food.count
        case "Clothes":
            return Clothes.count
        case "Drinks":
            return Drinks.count
        case "Groceries":
            return Groceries.count
        case "Education":
            return Education.count
        case "Housing":
            return Housing.count
        default:
            return 0
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath)
        switch button{
        case "Food":
            let exp = Food[indexPath.row]
            cell.textLabel?.text = exp.note
            cell.detailTextLabel?.text = "\(currency) \(String(exp.amount))"
        case "Clothes":
            let exp = Clothes[indexPath.row]
            cell.textLabel?.text = exp.note
            cell.detailTextLabel?.text = "\(currency) \(String(exp.amount))"
        case "Drinks":
            let exp = Drinks[indexPath.row]
            cell.textLabel?.text = exp.note
            cell.detailTextLabel?.text = "\(currency) \(String(exp.amount))"
        case "Groceries":
            let exp = Groceries[indexPath.row]
            cell.textLabel?.text = exp.note
            cell.detailTextLabel?.text = "\(currency) \(String(exp.amount))"
        case "Education":
            let exp = Education[indexPath.row]
            cell.textLabel?.text = exp.note
            cell.detailTextLabel?.text = "\(currency) \(String(exp.amount))"
        case "Housing":
            let exp = Housing[indexPath.row]
            cell.textLabel?.text = exp.note
            cell.detailTextLabel?.text = "\(currency) \(String(exp.amount))"
        default:
            _ = 1
        }
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let deletedExpense = expenses[indexPath.row]
            let curr = deletedExpense.amount
            amountSpent -= curr
            
            expenses.remove(at: indexPath.row)
            
            switch deletedExpense.category{
            case "Food":
                if let index = Food.firstIndex(where: { $0.note == deletedExpense.note }) {
                            Food.remove(at: index)
                        }
            case "Clothes":
                if let index = Clothes.firstIndex(where: { $0.note == deletedExpense.note }) {
                            Clothes.remove(at: index)
                        }
            case "Drinks":
                if let index = Drinks.firstIndex(where: { $0.note == deletedExpense.note }) {
                            Drinks.remove(at: index)
                        }

            case "Groceries":
                if let index = Groceries.firstIndex(where: { $0.note == deletedExpense.note }) {
                            Groceries.remove(at: index)
                        }
            case "Education":
                if let index = Education.firstIndex(where: { $0.note == deletedExpense.note }) {
                            Education.remove(at: index)
                        }

            case "Housing":
                if let index = Housing.firstIndex(where: { $0.note == deletedExpense.note }) {
                            Housing.remove(at: index)
                        }
            default:
                break
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } //else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        //}
    }

    @IBAction func backFunc(_ sender: Any) {
        dismiss(animated: true)
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
