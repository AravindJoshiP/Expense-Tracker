//
//  Expenses.swift
//  Expense Tracker
//
//  Created by Aravind Joshi Penumaka on 3/5/26.
//

import Foundation
import UIKit

let expenses = [
    Expense(amount: 200,
            category: "Clothes",
            date: Date(),
            note: "Bought clothes at Zara"),
    Expense(amount: 70,
            category: "Lunch",
            date: Date(),
            note: "Lunch at Maharaja"),
    Expense(amount: 6,
            category: "Coffee",
            date: Date(),
            note: "Coffee at Starbucks")
]

class Expense{
    
    var amount: Int
    var category: String
    var date: Date
    var note: String
    
    init(amount: Int, category: String, date: Date, note: String) {
        self.amount = amount
        self.category = category
        self.date = date
        self.note = note
    }
}
