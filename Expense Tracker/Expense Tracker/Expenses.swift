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
    Expense(amount: 95,
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
    Expense(amount: 600,
            category: "Education",
            date: Date(),
            note: "Health insurance from University"),
    Expense(amount: 35,
            category: "Groceries",
            date: Date(),
            note: "Vegetables"),
    Expense(amount: 42,
            category: "Food",
            date: Date(),
            note: "Chicken biryani from Maharaja"),
    Expense(amount: 12,
            category: "Drinks",
            date: Date(),
            note: "Water for road trip"),
    Expense(amount: 120,
            category: "Clothes",
            date: Date(),
            note: "Winter jacket"),
    Expense(amount: 32,
            category: "Housing",
            date: Date(),
            note: "Plumbing work in Kitchen"),
]


var Food = [
    Expense(amount: 70,
            category: "Food",
            date: Date(),
            note: "Lunch at Maharaja"),
    Expense(amount: 42,
            category: "Food",
            date: Date(),
            note: "Chicken biryani from Maharaja")
]

var Clothes = [
    Expense(amount: 200,
            category: "Clothes",
            date: Date(),
            note: "Bought clothes at Zara"),
    Expense(amount: 120,
            category: "Clothes",
            date: Date(),
            note: "Winter jacket")
]

var Drinks = [
    Expense(amount: 95,
            category: "Drinks",
            date: Date(),
            note: "Coffee at Starbucks"),
    Expense(amount: 12,
            category: "Drinks",
            date: Date(),
            note: "Water for road trip")
]

var Groceries = [
    Expense(amount: 60,
            category: "Groceries",
            date: Date(),
            note: "Monthly Groceries from Jewel Osco"),
    Expense(amount: 35,
            category: "Groceries",
            date: Date(),
            note: "Vegetables")
]

var Education = [
    Expense(amount: 600,
            category: "Education",
            date: Date(),
            note: "Health insurance from University")
]

var Housing = [
    Expense(amount: 600,
            category: "Housing",
            date: Date(),
            note: "House Rent for March"),
    Expense(amount: 32,
            category: "Housing",
            date: Date(),
            note: "Plumbing work in Kitchen")
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
