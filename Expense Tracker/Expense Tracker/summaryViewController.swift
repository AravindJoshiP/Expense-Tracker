//
//  summaryViewController.swift
//  Expense Tracker
//
//  Created by Aravind Joshi Penumaka on 3/5/26.
//

import UIKit

class summaryViewController: UIViewController {
    
    @IBOutlet weak var pieChartView: PieChartView!

    @IBOutlet weak var legendStackView: UIStackView!
    @IBOutlet weak var amountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        amountLabel.text = "\(currency) \(amountSpent)"
        pieChartView.expenses = expenses
        setupLegend()
    }
    
    func setupLegend() {
           // clear old legend rows
           for view in legendStackView.arrangedSubviews {
               legendStackView.removeArrangedSubview(view)
               view.removeFromSuperview()
           }
           
           let groupedTotals = groupedCategoryTotals()
           let colors = pieChartView.legendColors()
           
           for (index, item) in groupedTotals.enumerated() {
               let row = createLegendRow(
                   color: colors[index % colors.count],
                   category: item.category,
                   amount: item.total
               )
               legendStackView.addArrangedSubview(row)
           }
       }
       
       func groupedCategoryTotals() -> [(category: String, total: Int)] {
           var totals: [String: Int] = [:]
           
           for expense in expenses {
               totals[expense.category, default: 0] += expense.amount
           }
           
           return totals.sorted { $0.key < $1.key }
               .map { (category: $0.key, total: $0.value) }
       }
       
       func createLegendRow(color: UIColor, category: String, amount: Int) -> UIView {
           let rowStack = UIStackView()
           rowStack.axis = .horizontal
           rowStack.alignment = .center
           rowStack.distribution = .fill
           rowStack.spacing = 10
           
           let colorBox = UIView()
           colorBox.translatesAutoresizingMaskIntoConstraints = false
           colorBox.backgroundColor = color
           colorBox.layer.cornerRadius = 6
           
           NSLayoutConstraint.activate([
               colorBox.widthAnchor.constraint(equalToConstant: 12),
               colorBox.heightAnchor.constraint(equalToConstant: 12)
           ])
           
           let categoryLabel = UILabel()
           categoryLabel.text = category
           categoryLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
           categoryLabel.textColor = .label
           
           let spacer = UIView()
           
           let amountValueLabel = UILabel()
           amountValueLabel.text = "\(currency) \(amount)"
           amountValueLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
           amountValueLabel.textColor = .secondaryLabel
           amountValueLabel.textAlignment = .right
           
           rowStack.addArrangedSubview(colorBox)
           rowStack.addArrangedSubview(categoryLabel)
           rowStack.addArrangedSubview(spacer)
           rowStack.addArrangedSubview(amountValueLabel)
           
           return rowStack
       }

    @IBAction func rightSwipe(_ sender: Any) {
        tabBarController?.selectedIndex -= 1
    }
    
    @IBAction func leftSwipe(_ sender: Any) {
        tabBarController?.selectedIndex += 1
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
