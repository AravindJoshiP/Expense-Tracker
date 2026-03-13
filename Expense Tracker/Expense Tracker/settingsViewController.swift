//
//  settingsViewController.swift
//  Expense Tracker
//
//  Created by Aravind Joshi Penumaka on 3/5/26.
//

import UIKit

class settingsViewController: UIViewController {

    @IBOutlet weak var themeDropdown: UIButton!
    @IBOutlet weak var currencydropdown: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let option1 = UIAction(title: "USD"){ [weak self] action in
            self?.currencydropdown.setTitle(action.title, for: .normal)
        }
        
        let option2 = UIAction(title: "INR"){ [weak self] action in
            self?.currencydropdown.setTitle(action.title, for: .normal)
        }
        
        let option3 = UIAction(title: "GBP"){ [weak self] action in
            self?.currencydropdown.setTitle(action.title, for: .normal)
        }
        // Do any additional setup after loading the view.
        let menu = UIMenu(title: "Choose Currency", children: [option1,option2,option3])
        
        currencydropdown.menu = menu
        currencydropdown.showsMenuAsPrimaryAction = true
        
        let theme1 = UIAction(title: "Dark"){ [weak self] action in
            self?.themeDropdown.setTitle(action.title, for: .normal)
        }
        let theme2 = UIAction(title: "Light"){ [weak self] action in
            self?.themeDropdown.setTitle(action.title, for: .normal)
        }
        
        let themes = UIMenu(title: "Select the theme", children: [theme1,theme2])
        
        themeDropdown.menu = themes
        themeDropdown.showsMenuAsPrimaryAction = true
    }
    
    @IBAction func currencyValue(_ sender: UIButton) {
        let val = currencydropdown.titleLabel?.text
        if(val == "GBP"){
            currency = "£"
        }
        else if(val == "INR"){
            currency = "₹"
        }
        else{
            currency = "$"
        }
    }
    
    @IBAction func saveFunc(_ sender: Any) {
        let val = currencydropdown.titleLabel?.text
        if(val == "GBP"){
            currency = "£"
        }
        else if(val == "INR"){
            currency = "₹"
        }
        else{
            currency = "$"
        }
        let theme = themeDropdown.titleLabel?.text
        if(theme == "Light"){
            lightMode()
            dark = false
        }
        else{
            darkMode()
            dark = true
            
        }
    }
    
    
    func darkMode(){
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first else {return}
        window.overrideUserInterfaceStyle = .dark
    }
    func lightMode(){
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first else {return}
        window.overrideUserInterfaceStyle = .light
    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    @IBAction func leftSwipe(_ sender: Any) {
        tabBarController?.selectedIndex += 1
    }
    @IBAction func rightSwipe(_ sender: Any) {
        tabBarController?.selectedIndex -= 1
    }
}
