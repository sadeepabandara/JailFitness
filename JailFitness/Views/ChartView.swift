//
//  ChartView.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-19.
//

import UIKit

class ChartView: UIView {
    
    private var dataEntries: [CGFloat] = []
        
        override func draw(_ rect: CGRect) {
            super.draw(rect)
            
            
            
            guard let context = UIGraphicsGetCurrentContext() else {
                return
            }
            
            let chartWidth = rect.width
            let chartHeight = rect.height - 20  // Leave some space at the bottom for labels
            
            let columnXPoint = { (column: Int) -> CGFloat in
                let spacing = chartWidth / CGFloat(self.dataEntries.count + 1)
                return CGFloat(column + 1) * spacing
            }
            
            let columnYPoint = { (value: CGFloat) -> CGFloat in
                let maxValue = self.dataEntries.max() ?? 0
                let yScale = (chartHeight - 20) / maxValue
                return chartHeight - value * yScale
            }
            
            // Draw bars for bar chart
            let barWidth: CGFloat = 38
            let barSpacing: CGFloat = 20
            var xPosition: CGFloat = 0
            
            for (_, value) in dataEntries.enumerated() {
                let columnHeight = columnYPoint(value)
                let barRect = CGRect(x: xPosition, y: columnHeight, width: barWidth, height: chartHeight - columnHeight)
                
                context.setFillColor(UIColor.systemYellow.cgColor)
                context.fill(barRect)
                
                xPosition += barSpacing + barWidth
            }
            
            // Draw line for line chart
            context.setStrokeColor(UIColor.gray.cgColor)
            context.setLineWidth(2.0)
            
            let linePath = UIBezierPath()
            linePath.move(to: CGPoint(x: columnXPoint(0), y: columnYPoint(dataEntries[0])))
            
            for i in 1..<dataEntries.count {
                let nextPoint = CGPoint(x: columnXPoint(i), y: columnYPoint(dataEntries[i]))
                linePath.addLine(to: nextPoint)
            }
            
            context.addPath(linePath.cgPath)
            context.strokePath()
        }
        
        func updateChart(with data: [CGFloat]) {
            dataEntries = data
            setNeedsDisplay()
        }
}
