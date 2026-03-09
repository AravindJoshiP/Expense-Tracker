import UIKit

class PieChartView: UIView {
    
    var expenses: [Expense] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    let sliceColors: [UIColor] = [
        UIColor(red: 0.36, green: 0.78, blue: 0.60, alpha: 1),
        UIColor(red: 0.38, green: 0.64, blue: 0.94, alpha: 1),
        UIColor(red: 0.98, green: 0.69, blue: 0.32, alpha: 1),
        UIColor(red: 0.55, green: 0.76, blue: 0.85, alpha: 1),
        UIColor(red: 0.72, green: 0.57, blue: 0.90, alpha: 1),
        UIColor(red: 0.93, green: 0.46, blue: 0.46, alpha: 1)
    ]
    
    override func draw(_ rect: CGRect) {
        guard !expenses.isEmpty else { return }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let totalsByCategory = groupedCategoryTotals()
        let totalAmount = totalsByCategory.values.reduce(0, +)
        
        guard totalAmount > 0 else { return }
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2 - 10
        
        var startAngle = -CGFloat.pi / 2
        let categories = Array(totalsByCategory.keys).sorted()
        
        for (index, category) in categories.enumerated() {
            let amount = totalsByCategory[category] ?? 0
            let sliceAngle = (CGFloat(amount) / CGFloat(totalAmount)) * 2 * CGFloat.pi
            let endAngle = startAngle + sliceAngle
            
            context.move(to: center)
            context.setFillColor(sliceColors[index % sliceColors.count].cgColor)
            context.addArc(center: center,
                           radius: radius,
                           startAngle: startAngle,
                           endAngle: endAngle,
                           clockwise: false)
            context.closePath()
            context.fillPath()
            
            context.move(to: center)
            context.addArc(center: center,
                           radius: radius,
                           startAngle: startAngle,
                           endAngle: endAngle,
                           clockwise: false)
            context.closePath()
            context.setStrokeColor(UIColor.white.cgColor)
            context.setLineWidth(2)
            context.strokePath()
            
            startAngle = endAngle
        }
        
        context.setFillColor(UIColor.white.cgColor)
        context.addArc(center: center,
                       radius: radius * 0.50,
                       startAngle: 0,
                       endAngle: 2 * CGFloat.pi,
                       clockwise: false)
        context.fillPath()
    }
    
    private func groupedCategoryTotals() -> [String: Int] {
        var totals: [String: Int] = [:]
        
        for expense in expenses {
            totals[expense.category, default: 0] += expense.amount
        }
        
        return totals
    }
}
