//
//  ProgressViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-04-14.
//

import UIKit

class ProgressViewController: UIViewController {
    
    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    let customOrange = UIColor(red: 249.0/255.0, green: 155.0/255.0, blue: 125.0/255.0, alpha: 1)
    
    private var chartView: ChartView!
    
    let coverImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "progressImage"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 28)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Monthly Progress"
        label.textAlignment = .center
        return label
    }()
    
    let monthDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Every moment is a fresh beginning."
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        label.sizeToFit()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContraints()
        setupChartView()
    }
    
    func setupContraints() {
        view.backgroundColor = customBlue
        
        view.addSubview(coverImage)
        view.addSubview(monthLabel)
        view.addSubview(monthDescLabel)
        
        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: view.topAnchor),
            coverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverImage.heightAnchor.constraint(equalToConstant: 300),
        ])
        
        NSLayoutConstraint.activate([
            monthLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160),
            monthLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            monthDescLabel.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 5),
            monthDescLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            monthDescLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    func setupChartView() {
        chartView = ChartView(frame: CGRect(x: 0, y: 390, width: 400, height: 250))
        chartView.backgroundColor = customBlue
        let data: [CGFloat] = [74, 69, 65, 68, 62, 58, 56]
        
        chartView.updateChart(with: data)
        view.addSubview(chartView)
        
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 20),
            chartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chartView.widthAnchor.constraint(equalToConstant: 400),
            chartView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

class ChartView: UIView {
    
    private var dataEntries: [CGFloat] = []
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let chartWidth = rect.width
        let chartHeight = rect.height - 20
        
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
        let barWidth: CGFloat = 35
        let barSpacing: CGFloat = 20
        var xPosition: CGFloat = 13
        
        for (_, value) in dataEntries.enumerated() {
            let columnHeight = columnYPoint(value)
            let barRect = CGRect(x: xPosition, y: columnHeight, width: barWidth, height: chartHeight - columnHeight)
            
            context.setFillColor(CGColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1))
            context.fill(barRect)
            context.fillPath()
            
            xPosition += barSpacing + barWidth
        }
        
        // Draw line for line chart
        context.setStrokeColor(UIColor.systemGray4.cgColor)
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
