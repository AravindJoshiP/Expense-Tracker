//
//  Expenses.swift
//  Expense Tracker
//
//  Created by Aravind Joshi Penumaka on 3/5/26.
//

import Foundation
import UIKit

var expenses = [
    Expense(amount: 200,
            category: "Clothes",
            date: Date(),
            note: "Bought clothes at Zara"),
    Expense(amount: 70,
            category: "Food",
            date: Date(),
            note: "Lunch at Maharaja"),
    Expense(amount: 6,
            category: "Drinks",
            date: Date(),
            note: "Coffee at Starbucks"),
    Expense(amount: 600,
            category: "Housing",
            date: Date(),
            note: "House Rent for March"),
    Expense(amount: 60,
            category: "Groceries",
            date: Date(),
            note: "Monthly Groceries from Jewel Osco"),
    Expense(amount: 800,
            category: "Education",
            date: Date(),
            note: "Health insurance from University")
]

var Food = [
    Expense(amount: 70,
            category: "Food",
            date: Date(),
            note: "Lunch at Maharaja")
]

var Clothes = [
    Expense(amount: 200,
            category: "Clothes",
            date: Date(),
            note: "Bought clothes at Zara")
]

var Drinks = [
    Expense(amount: 6,
            category: "Drinks",
            date: Date(),
            note: "Coffee at Starbucks")
]

var Groceries = [
    Expense(amount: 60,
            category: "Groceries",
            date: Date(),
            note: "Monthly Groceries from Jewel Osco")
]

var Education = [
    Expense(amount: 800,
            category: "Education",
            date: Date(),
            note: "Health insurance from University")
]

var Housing = [
    Expense(amount: 600,
            category: "Housing",
            date: Date(),
            note: "House Rent for March")
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
