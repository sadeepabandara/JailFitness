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
    
    func addComponents() {
        view.addSubview(chartView)
    }
        
    func setupChartView() {
        chartView = ChartView(frame: CGRect(x: 0, y: 700, width: 400, height: 200))
        chartView.backgroundColor = customBlueLight
            
        let data: [CGFloat] = [74, 69, 65, 61, 63, 68, 60]
        chartView.updateChart(with: data)
    }
}
