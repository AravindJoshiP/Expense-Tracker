//
//  HomeScreenViewController.swift
//  Expense Tracker
//
//  Created by Aravind Joshi Penumaka on 3/3/26.
//

import UIKit

var amountSpent:Int = 0
var currency: String = "$"
var Budget: Int = 5000
class HomeScreenViewController: UIViewController {

    @IBOutlet weak var donutChartView: DonutChartView!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in expenses{
            amountSpent += i.amount
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        amountLabel.text = "\(currency) \(amountSpent)"
        budgetLabel.text = "\(currency) \(Budget)"
        
        donutChartView.amountSpent = CGFloat(amountSpent)
        donutChartView.budget = CGFloat(Budget)
        
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
