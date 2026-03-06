//
//  donutChartView.swift
//  Expense Tracker
//
//  Created by Aravind Joshi Penumaka on 3/6/26.
//

import UIKit

class DonutChartView: UIView {
    
    var amountSpent: CGFloat = 0 {
        didSet { setNeedsDisplay() }
    }
    
    var budget: CGFloat = 1 {
        didSet { setNeedsDisplay() }
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let lineWidth: CGFloat = 25
        let radius = min(rect.width, rect.height) / 2 - lineWidth
        
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + (2 * CGFloat.pi)
        
        // Prevent division by zero
        let safeBudget = max(budget, 1)
        let progress = min(amountSpent / safeBudget, 1.0)
        let spentEndAngle = startAngle + (2 * CGFloat.pi * progress)
        
        context.setLineWidth(lineWidth)
        context.setLineCap(.round)
        
        // Background ring = full budget
        context.setStrokeColor(UIColor.systemGray4.cgColor)
        context.addArc(center: center,
                       radius: radius,
                       startAngle: startAngle,
                       endAngle: endAngle,
                       clockwise: false)
        context.strokePath()
        
        // Spent ring
        context.setStrokeColor(UIColor.systemOrange.cgColor)
        context.addArc(center: center,
                       radius: radius,
                       startAngle: startAngle,
                       endAngle: spentEndAngle,
                       clockwise: false)
        context.strokePath()
        
        // Optional center text
        let percentText = "\(Int(progress * 100))%"
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 22),
            .foregroundColor: UIColor.black
        ]
        
        let textSize = percentText.size(withAttributes: attributes)
        let textRect = CGRect(
            x: center.x - textSize.width / 2,
            y: center.y - textSize.height / 2,
            width: textSize.width,
            height: textSize.height
        )
        
        percentText.draw(in: textRect, withAttributes: attributes)
    }
}
