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

    private var chartView: ChartView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = customBlue
            
            setupChartView()
        }
        
        private func setupChartView() {
            chartView = ChartView(frame: CGRect(x: 0, y: 100, width: 400, height: 200))
            view.addSubview(chartView)
            
            let data: [CGFloat] = [75, 54, 73, 72, 73, 72, 71]
            chartView.updateChart(with: data)
        }
}
