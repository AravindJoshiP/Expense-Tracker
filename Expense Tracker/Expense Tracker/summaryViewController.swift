//
//  summaryViewController.swift
//  Expense Tracker
//
//  Created by Aravind Joshi Penumaka on 3/5/26.
//

import UIKit

class summaryViewController: UIViewController {
    
    @IBOutlet weak var pieChartView: PieChartView!

    @IBOutlet weak var amountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        amountLabel.text = "\(currency) \(amountSpent)"
        pieChartView.expenses = expenses
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
