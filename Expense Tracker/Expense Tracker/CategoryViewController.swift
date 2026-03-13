//
//  CategoryViewController.swift
//  Expense Tracker
//
//  Created by Aravind Joshi Penumaka on 3/6/26.
//

import UIKit

var button: String = ""

class CategoryViewController: UIViewController {

    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var clothesButton: UIButton!
    @IBOutlet weak var drinksButton: UIButton!
    @IBOutlet weak var grocButton: UIButton!
    @IBOutlet weak var educationButton: UIButton!
    @IBOutlet weak var housingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func foodFunc(_ sender: Any) {
        button = (foodButton.titleLabel?.text)!
    }
    
    @IBAction func clothesFunc(_ sender: Any) {
        button = (clothesButton.titleLabel?.text)!
    }
    
    @IBAction func drinkFunc(_ sender: Any) {
        button = (drinksButton.titleLabel?.text)!
    }
    
    @IBAction func grocFunc(_ sender: Any) {
        button = (grocButton.titleLabel?.text)!
    }
    
    @IBAction func educFunc(_ sender: Any) {
        button = (educationButton.titleLabel?.text)!
    }
    
    @IBAction func houseFunc(_ sender: Any) {
        button = (housingButton.titleLabel?.text)!
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
