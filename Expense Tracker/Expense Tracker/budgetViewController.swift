//
//  budgetViewController.swift
//  Expense Tracker
//
//  Created by Aravind Joshi Penumaka on 3/5/26.
//

import UIKit

class budgetViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var budgetLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        budgetLabel.text = "\(currency) \(Budget)"
        slider.value = Float(Budget)
    }
    
    @IBAction func sliderFunc(_ sender: Any) {
        let curr = slider.value
        Budget = Int(curr)
        budgetLabel.text = "\(currency) \(Budget)"
    }
    
    @IBAction func updateFunc(_ sender: Any) {
        Budget = Int(slider.value)
    }
    @IBAction func backFunc(_ sender: Any) {
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
